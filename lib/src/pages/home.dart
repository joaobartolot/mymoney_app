import 'package:flutter/material.dart';
import 'package:my_money/src/model/expense.dart';
import 'package:my_money/src/provider/home.dart';
import 'package:my_money/src/service/authentication.dart';
import 'package:my_money/src/service/expense.dart';
import 'package:my_money/src/service/user.dart';
import 'package:my_money/src/widgets/expenses_list.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, _) => Scaffold(
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
              FutureBuilder<List<Expense>>(
                future: ExpenseService().getAll().then(
                      (event) => context.read<HomeProvider>().expenses = event,
                    ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const ExpensesList();
                  }

                  return const Text('No Items found');
                },
              ),
              ElevatedButton(
                onPressed: () => UserService().saveUser(),
                child: const Text("Save test"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
