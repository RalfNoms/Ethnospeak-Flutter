import 'package:capstone_project/pages/FirebaseInit.dart';
import 'package:capstone_project/pages/Home.dart';
import 'package:capstone_project/pages/Login.dart';
import 'package:capstone_project/pages/Register.dart';
import 'package:capstone_project/pages/activity.dart';
import 'package:capstone_project/pages/audio.dart';
import 'package:capstone_project/pages/dictionary.dart';
import 'package:capstone_project/pages/profile.dart';
import 'package:capstone_project/pages/translate.dart';
import 'package:capstone_project/pages/translate_text.dart';
import 'package:capstone_project/pages/vocabul.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await FirebaseInit.run();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ExitConfirmationWrapper(child: Login()), // Wrapped with ExitConfirmationWrapper
      routes: {
        '/Login': (context) => const ExitConfirmationWrapper(child: Login()),
        '/Register': (context) => const ExitConfirmationWrapper(child: Register()),
        '/Home': (context) => const ExitConfirmationWrapper(child: Home()),
        '/Dictionary': (context) => const ExitConfirmationWrapper(child: Dictionary()),
        '/Activity': (context) => const ExitConfirmationWrapper(child: Activity()),
        '/vocabul': (context) => const ExitConfirmationWrapper(child: Vocabul()),
        '/translate': (context) => const ExitConfirmationWrapper(child: Translate()),
        '/translatetext': (context) => const ExitConfirmationWrapper(child: TranslateText()),
        '/audio': (context) => const ExitConfirmationWrapper(child: Audio()),
        '/profile': (context) => const ExitConfirmationWrapper(child: Profile()),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// Wrapper to handle back button with confirmation dialog
class ExitConfirmationWrapper extends StatelessWidget {
  final Widget child;
  const  ExitConfirmationWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show exit confirmation dialog only when the physical back button is pressed
        return await showExitDialog(context);
      },
      child: child,
    );
  }

  // Function to show the exit confirmation dialog
  Future<bool> showExitDialog(BuildContext context) async {
    bool exit = false;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Do you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Stay in the app
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              exit = true; // Set to exit
              Navigator.of(context).pop(true); // Exit the app
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
    if (exit) {
      SystemNavigator.pop(); // Exit the app
    }
    return false; // Stay in the app if "No" is pressed or dialog is dismissed
  }
}







