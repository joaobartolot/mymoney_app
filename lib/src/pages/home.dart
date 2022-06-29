import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_money/src/service/authentication.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () => Authentication.signOut(
              context: context,
            ).then(
              (value) => Navigator.of(context).pushReplacementNamed('/login'),
            ),
            child: const Text("Sign out"),
          ),
        ),
      ),
    );
  }
}
