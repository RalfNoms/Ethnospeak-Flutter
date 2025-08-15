import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Audio extends StatefulWidget {
  const Audio({super.key});

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
 bool _islistening = false;
 final SpeechToText _speechToText = SpeechToText();
 


  // Audio play function that loads the asset from the correct path
  Future<void> audioplay() async {
    final player = AudioPlayer();
    // Use the AssetSource and specify the correct path to the audio file
    await player.play(AssetSource('audio/sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text("Tiya"),
              const SizedBox(height: 50),
              
             Align(
               alignment: AlignmentDirectional.centerStart,
                child: ElevatedButton(
                  onPressed: () {
                    audioplay();
                  },
                  child: const Text("Play Audio"),
              ),
          
          ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerRight,
                 child: ElevatedButton(
                  onPressed: () {
                    print("Speech functionality can be implemented here");
                  },
                  child: const Text("Speak"),
                ),
              ),
               ElevatedButton(
                onPressed: () {
                  print("Speech functionality can be implemented here");
                },
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
