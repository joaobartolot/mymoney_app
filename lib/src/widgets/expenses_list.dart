import 'package:flutter/material.dart';
import 'package:my_money/src/provider/edit_expense.dart';
import 'package:my_money/src/provider/home.dart';
import 'package:provider/provider.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditExpenseProvider(),
      builder: (context, _) => Expanded(
        child: ListView.builder(
          itemCount: context.watch<HomeProvider>().expenses.length,
          itemBuilder: (context, index) => Card(
            child: InkWell(
              onTap: () {
                context.read<EditExpenseProvider>().expense =
                    context.read<HomeProvider>().expenses[index];

                Navigator.of(context).pushNamed('/edit-expense');
              },
              child: ListTile(
                title: Text(
                  context.watch<HomeProvider>().expenses[index].name,
                ),
                trailing: Text(
                  context
                      .watch<HomeProvider>()
                      .expenses[index]
                      .price
                      .toString(),
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
