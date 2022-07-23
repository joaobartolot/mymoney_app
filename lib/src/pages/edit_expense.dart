import 'package:flutter/material.dart';
import 'package:my_money/src/provider/edit_expense.dart';
import 'package:provider/provider.dart';

class EditExpense extends StatelessWidget {
  const EditExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EditExpenseProvider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text(
                context.watch<EditExpenseProvider>().expense.name,
              ),
              Text(
                context.watch<EditExpenseProvider>().expense.price.toString(),
              ),
              ElevatedButton(
                onPressed: () => context
                    .read<EditExpenseProvider>()
                    .delete(
                      context.read<EditExpenseProvider>().expense.uid,
                    )
                    .then(
                      (value) => Navigator.of(context).pop(),
                    ),
                child: const Text('delete'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
