import 'package:flutter/material.dart';
import 'package:my_money/src/model/expense.dart';
import 'package:my_money/src/service/authentication.dart';
import 'package:my_money/src/service/expense.dart';

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
            StreamBuilder<List<Expense>>(
                stream: ExpenseService().getAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Expense> data = snapshot.data!;
                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) => Text(
                          data[index].name,
                        ),
                      ),
                    );
                  }

                  return const Text('No Items found');
                })
          ],
        ),
      ),
    );
  }
}
