import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:my_money/src/provider/new_expense.dart';
import 'package:provider/provider.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.blue;
    return ChangeNotifierProvider(
      create: (_) => NewExpenseProvider(),
      builder: (context, _) => SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Add expense',
                style: TextStyle(
                  color: textColor, // TODO: Change later
                ),
              ),
              backgroundColor: Colors.white12,
              elevation: 0,
              iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
              actions: const [],
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      TextField(
                        onChanged: (value) =>
                            context.read<NewExpenseProvider>().name = value,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        onChanged: (value) => context
                            .read<NewExpenseProvider>()
                            .handlePriceField(value),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Price',
                          border: OutlineInputBorder(),
                        ),
                        inputFormatters: [
                          CurrencyTextInputFormatter(
                            locale: Platform.localeName,
                            symbol: '',
                          )
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => context
                        .read<NewExpenseProvider>()
                        .save()
                        .then((value) => Navigator.of(context).pop()),
                    child: const Text('Add'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
