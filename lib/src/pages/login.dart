// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () => GoogleSignIn().signIn().then(
                  (value) => Navigator.of(context).pushNamed('/'),
                ),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              child: Image.network(
                'http://pngimg.com/uploads/google/google_PNG19635.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
