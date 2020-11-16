import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymoney_app/widgets/expense_form.dart';

class HomePage extends StatelessWidget {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final TextEditingController nameController = new TextEditingController();
  final MoneyMaskedTextController priceController =
      new MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  final String userUid = FirebaseAuth.instance.currentUser.uid;

  final DateTime today = new DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
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
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => saveExpense(
                    name: nameController.text,
                    value: priceController.numberValue,
                    date: DateTime.now(),
                  ).then((value) => Navigator.of(context).pop()),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: db
                .collection('expense')
                .where('user_uid', isEqualTo: userUid)
                .where('date', isGreaterThanOrEqualTo: today)
                .orderBy('date', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              var data = snapshot.data;

              if (snapshot.hasData && data != null && data.docs.length > 0)
                return ListView.builder(
                  itemBuilder: (context, i) => ExpenseItem(
                    item: data.docs[i],
                  ),
                  itemCount: data.docs.length,
                );
              return Text(
                  "You don't have any expense, please click in the add button");
            },
          ),
        ),
      ),
    );
  }

  Future<DocumentReference> saveExpense(
      {String name, double value, DateTime date}) {
    return db.collection('expense').add({
      'user_uid': userUid,
      'name': name,
      'value': value,
      'date': date,
      'date_updated': DateTime.now(),
    });
  }
}

class ExpenseItem extends StatelessWidget {
  final QueryDocumentSnapshot item;
  const ExpenseItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${item['name'].toString()}'),
      subtitle: Text('R\$ ${item['value'].toString()}'),
      trailing: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.delete_outline),
          ),
          onTap: () => item.reference.delete(),
        ),
      ),
    );
  }
}
