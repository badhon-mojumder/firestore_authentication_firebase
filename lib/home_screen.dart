import 'package:flutter/material.dart';
import 'package:live_score_app/authentication/screens/signin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + Firebase'),
      backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
            }, child: Center(child: Text('Login Screen')))
          ],
        ),
      ),
    );
  }
}
