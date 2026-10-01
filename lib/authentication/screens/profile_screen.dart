import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_score_app/authentication/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Uesr Id : ${user?.uid ?? 'Unknown'}'),
            Text('Uesr Email : ${user?.email ?? 'Unknown'}'),
            ElevatedButton(
              onPressed: () async {
                await AuthService.logOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
