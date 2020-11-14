import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Add expense'),
                onPressed: () => print('implement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
