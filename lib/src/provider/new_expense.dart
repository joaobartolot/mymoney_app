import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:my_money/src/model/expense.dart';
import 'package:my_money/src/service/expense.dart';

class NewExpenseProvider extends ChangeNotifier {
  final Logger _logger = Logger();
  final ExpenseService _service = ExpenseService();

  String name = '';
  double price = 0.0;

  handlePriceField(String stringPrice) {
    price = stringPrice.isEmpty
        ? 0.0
        : double.parse(stringPrice.replaceAll(',', ''));

    _logger.d('The price has changed to : $price');
  }

  Future<ExpenseDocumentReference> save() {
    _logger.d('Saving expense "$name" that costs: $price');
    return _service.save(name, price);
  }
}
