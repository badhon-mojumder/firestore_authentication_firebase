import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_score_app/authentication/screens/profile_screen.dart';
import 'package:live_score_app/authentication/screens/signin_screen.dart';
import 'package:live_score_app/authentication/services/auth_service.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: AuthService.authChange(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          }
          final User? user = snapshot.data;
           if(user == null){
             return SignInScreen();
           }
           return ProfileScreen(user: user,);
        }
    );
  }
}
