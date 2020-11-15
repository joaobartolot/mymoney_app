import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymoney_app/widgets/expense_form.dart';

class HomePage extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final TextEditingController nameController = new TextEditingController();
  final MoneyMaskedTextController priceController =
      new MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: AlertDialog(
              content: NewExpenseForm(
                formKey: formKey,
                nameController: nameController,
                priceController: priceController,
              ),
              actions: [
                RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print(nameController.text);
                    saveExpense(
                      name: nameController.text,
                      value: priceController.numberValue,
                      date: DateTime.now(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, i) => Text('item ${i.toString()}'),
            itemCount: 10,
          ),
        ),
      ),
    );
  }

  void saveExpense({String name, double value, DateTime date}) {
    firestore.collection('expense').add({
      'name': name,
      'value': value,
      'date': date,
      'date_updated': DateTime.now(),
    });
  }
}
