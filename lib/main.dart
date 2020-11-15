import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mymoney_app/pages/home.dart';
import 'package:mymoney_app/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  bool isLogged = FirebaseAuth.instance.currentUser != null;

  runApp(App(initRoute: isLogged ? '/' : '/login'));
}

class App extends StatelessWidget {
  final String initRoute;

  App({this.initRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColorDark: Color(0xff072028),
          primaryColor: Color(0xff0f4c75),
          accentColor: Color(0xff0f4c81),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Color(0xff072028),
                displayColor: Color(0xff072028),
              )),
      initialRoute: initRoute,
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
