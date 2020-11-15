import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class NewExpenseForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final MoneyMaskedTextController priceController;

  NewExpenseForm({
    Key key,
    @required this.formKey,
    @required this.nameController,
    @required this.priceController,
  }) : super(key: key);

  final GlobalKey nameKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Flex(
        mainAxisSize: MainAxisSize.min,
        direction: Axis.vertical,
        children: [
          Text('New expense'),
          SizedBox(height: 20),
          TextFormField(
            key: nameKey,
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: priceController,
            decoration: InputDecoration(
              labelText: 'Price',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
