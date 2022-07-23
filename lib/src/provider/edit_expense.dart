import 'package:flutter/foundation.dart';
import 'package:my_money/src/model/expense.dart';
import 'package:my_money/src/service/expense.dart';

class EditExpenseProvider extends ChangeNotifier {
  final ExpenseService _service = ExpenseService();
  Expense _expense = Expense(name: '', price: 0.0);

  Expense get expense => _expense;

  set expense(Expense expense) {
    _expense = expense;
    notifyListeners();
  }

  Future<void> delete(String? uid) {
    return _service.delete(uid);
  }
}
