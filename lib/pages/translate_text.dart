import 'package:capstone_project/pages/Data_services/language_entity.dart'; // Adjust the path based on your file structure
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TranslateText extends StatefulWidget {
  const TranslateText({super.key});

  @override
  State<TranslateText> createState() => _TranslateTextState();
}

class _TranslateTextState extends State<TranslateText> {
  final LanguageEntity _languageEntity = LanguageEntity(); // Initialize LanguageEntity
  final TextEditingController _textController = TextEditingController(); // Controller for TextField
  String _translatedText = ""; // Variable to hold the translated text


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD0D0),
      appBar: AppBar(
         backgroundColor: Colors.transparent,
        title: const Text("Translate Text English to Bagobo"),
         leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          ),
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              minLines: 1,
              maxLines: 2,
              controller: _textController, // Attach controller to capture input
              decoration: const InputDecoration(
                hintText: "Enter text to translate",
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {        
                     _translatedText = _translateToBagoboKlata(text);   
                });
              },
            ),
            const SizedBox(height: 20), // Add space between TextField and result
            Expanded(
              child: Text(
                
                _translatedText.isNotEmpty
                    ? _translatedText
                    : "Translation will appear here", // Display translation
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
             const SizedBox(height: 15),
            // Show the copy button only if _translatedText is not empty
            if (_translatedText.isNotEmpty)
              ElevatedButton.icon(
                onPressed: copyTranslate,  // Call copyTranslate when button is pressed
                icon: const Icon(Icons.copy),
                label: const Text("Copy Translation"),
              ),
          ],
        ),
      ),
    );
  }
  void copyTranslate(){
     if(_translatedText.isNotEmpty){
        Clipboard.setData(ClipboardData(text: _translatedText));
         ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Copied text")),
      );
     }
  }

  // Function to translate text to Bagobo-Klata
  String _translateToBagoboKlata(String text) {
    List<String> words = text.toLowerCase().split(" ");
    List<String> translatedWords = words.map((word) {
      // If the word exists in the translation map, return the translation
      if (_languageEntity.translationMap.containsKey(word)) {
        return _languageEntity.translationMap[word]!;
      } else {
        // If the word doesn't exist, return the original word
        return word;
      }
    }).toList();

    return translatedWords.join(" ");
  }
}


