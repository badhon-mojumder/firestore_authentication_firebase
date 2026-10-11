import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:live_score_app/authentication/auth_gate.dart';
import 'package:live_score_app/firestore_crud/screen/notes_screen.dart';
import 'package:live_score_app/local_notification/screen/notification_lab_screen.dart';
import 'package:live_score_app/push_notification/screen/push_lab_screen.dart';
import 'firebase_options.dart';
import 'local_notification/screen/app_navigator.dart';
import 'local_notification/service/notification_service.dart';
import 'push_notification/service/push_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugPrint('Firebase Connected Successfully');

  try {
    await GoogleSignIn.instance.initialize();
  } catch (e) {
    debugPrint('Google Sign In not configured $e');
  }

  await NotificationService.init();
  await PushService.init();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const PushLabScreen(),
      navigatorKey: AppNavigator.key,
    );
  }
}
