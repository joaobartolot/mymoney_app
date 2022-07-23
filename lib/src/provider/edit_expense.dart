import 'package:flutter/foundation.dart';
import 'package:my_money/src/model/expense.dart';

class EditExpenseProvider extends ChangeNotifier {
  Expense _expense = Expense(name: '', price: 0.0);

  Expense get expense => _expense;

  set expense(Expense expense) {
    _expense = expense;
    notifyListeners();
  }
}
