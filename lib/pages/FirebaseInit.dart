import 'package:firebase_core/firebase_core.dart';

class FirebaseInit {
  static Future<void> run() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyALLVzJkQyFbijR-eOwsPtggnkkrhytQcQ',
      appId: '608631284095',
      messagingSenderId: '608631284095',
      projectId: 'fluttertranslator-9b574',
    ),
    );
  }
}