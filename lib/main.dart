import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_money/src/pages/add_expense.dart';
import 'package:my_money/src/pages/edit_expense.dart';
import 'package:my_money/src/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_money/src/pages/login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  bool userAuthenticated = FirebaseAuth.instance.currentUser != null;

  runApp(MyApp(initRoute: userAuthenticated ? '/' : '/login'));
}

class MyApp extends StatelessWidget {
  final String initRoute;

  const MyApp({Key? key, required this.initRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initRoute,
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/add-expense': (context) => const AddExpense(),
        '/edit-expense': (context) => const EditExpense(),
      },
    );
  }
}
