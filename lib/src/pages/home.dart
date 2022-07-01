import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_money/src/service/authentication.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/add-expense'),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Authentication.signOut(
                    context: context,
                  ).then(
                    (value) =>
                        Navigator.of(context).pushReplacementNamed('/login'),
                  ),
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Column(
              children: const [],
            )
          ],
        ),
      ),
    );
  }
}
