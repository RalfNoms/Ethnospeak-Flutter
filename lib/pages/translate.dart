import 'package:avatar_glow/avatar_glow.dart';
import 'package:capstone_project/pages/Data_services/language_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:string_similarity/string_similarity.dart';

class Translate extends StatefulWidget {
  const Translate({super.key});

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  
  bool _speechEnabled = false;
  bool _isProcessing = false;

  final TextEditingController _spokenWordsController = TextEditingController();
  final TextEditingController _translatedTextController = TextEditingController();

  final LanguageEntity _languageEntity = LanguageEntity();
  final Map<String, String> _translationMap = {};

  @override
  void initState() {
    super.initState();
    _initializeServices();
    _translationMap.addAll(_languageEntity.translationMap);
  }

  Future<void> _initializeServices() async {
    await initSpeech();
    await _initTTS();
  }

  Future<void> initSpeech() async {
    _speechEnabled = await _speechToText.initialize(
      onError: (error) => debugPrint("Speech error: $error"),
      onStatus: (status) => debugPrint("Status: $status"),
    );
    setState(() {});
  }

  Future<void> _initTTS() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);
  }

  Future<void> _startListening() async {
    if (_isProcessing) return;
    
    setState(() => _isProcessing = true);
    await _speechToText.listen(
      onResult: _onSpeechResult,
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 5),
    );
    setState(() => _isProcessing = false);
  }

  Future<void> _stopListening() async {
    if (!_speechToText.isListening) return;
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    if (!mounted) return;
    
    setState(() {
      _spokenWordsController.text = result.recognizedWords;
      _translatedTextController.text = _translateToBagoboKlata(result.recognizedWords);
    });
  }

  String _translateToBagoboKlata(String englishText) {
    // Remove punctuation and normalize input
    final input = englishText
        .replaceAll(RegExp(r'[^\w\s]'), '')
        .trim()
        .toLowerCase();
    
    if (input.isEmpty) return '';

    // 1. Check for exact match first
    if (_translationMap.containsKey(input)) {
      return _translationMap[input]!;
    }

    // 2. Try multi-word lookup
    final multiWordMatch = _translationMap.keys.firstWhere(
      (key) => key.split(' ').length > 1 && input.contains(key),
      orElse: () => '',
    );

    if (multiWordMatch.isNotEmpty) {
      return _translationMap[multiWordMatch]!;
    }

    // 3. Split into words and translate individually
    final words = input.split(' ');
    final translatedWords = words.map((word) {
      // Check exact match for individual word
      if (_translationMap.containsKey(word)) {
        return _translationMap[word]!;
      }

      // Fuzzy match with threshold
      final bestMatch = _getBestMatch(word, _translationMap.keys.toList());
      return bestMatch ?? word;
    }).toList();

    return translatedWords.join(' ');
  }

  String? _getBestMatch(String input, List<String> dictionary) {
    if (input.isEmpty || dictionary.isEmpty) return null;
    
    try {
      final bestMatch = StringSimilarity.findBestMatch(input, dictionary).bestMatch;
      
      return bestMatch?.rating != null && bestMatch.rating! > 0.7
          ? bestMatch.target
          : null;
    } catch (e) {
      debugPrint("Matching error: $e");
      return null;
    }
  }

  Future<void> _speakTranslatedText() async {
    if (_translatedTextController.text.isEmpty) return;
    
    try {
      await _flutterTts.speak(_translatedTextController.text);
    } catch (e) {
      debugPrint("TTS Error: $e");
    }
  }

  void _copyTranslatedText() {
    if (_translatedTextController.text.isEmpty) return;
    
    Clipboard.setData(ClipboardData(text: _translatedTextController.text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Copied to clipboard")),
    );
  }

  @override
  void dispose() {
    _speechToText.stop();
    _flutterTts.stop();
    _spokenWordsController.dispose();
    _translatedTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD0D0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Speak to Translate"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _speechToText.isListening
                  ? "Listening... Speak now"
                  : _speechEnabled
                      ? "Tap mic to start speaking"
                      : "Speech not available",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _spokenWordsController,
                        decoration: const InputDecoration(
                          labelText: "Spoken Words",
                          border: InputBorder.none,
                        ),
                        readOnly: true,
                        maxLines: null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _translatedTextController,
                        decoration: const InputDecoration(
                          labelText: "Bagobo-Klata Translation",
                          border: InputBorder.none,
                        ),
                        readOnly: true,
                        maxLines: null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_translatedTextController.text.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.copy, size: 28),
                          onPressed: _copyTranslatedText,
                          color: Colors.green,
                          tooltip: "Copy Translation",
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _speechToText.isListening,
        glowColor: Colors.blue,
        duration: const Duration(milliseconds: 2000),
        repeat: true,
        child: FloatingActionButton.large(
          backgroundColor: Colors.blue,
          onPressed: _speechToText.isListening ? _stopListening : _startListening,
          child: Icon(
            _speechToText.isListening ? Icons.mic : Icons.mic_none,
            size: 32,
          ),
        ),
      ),
    );
  }
}



 
