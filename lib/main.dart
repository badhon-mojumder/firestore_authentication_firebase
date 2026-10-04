import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:live_score_app/authentication/auth_gate.dart';
import 'package:live_score_app/firestore_crud/screen/notes_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  debugPrint('Firebase Connected Successfully');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const NotesScreen(),
    );
  }
}
