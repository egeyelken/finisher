import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthService().signInWithGoogle();
          },
          child: Text("Sign in with Google"),
        ),
      ),
    );
  }
}
