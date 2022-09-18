import 'package:flutter/foundation.dart';
import 'package:my_money/src/model/expense_old.dart';
import 'package:my_money/src/service/expense.dart';

class EditExpenseProvider extends ChangeNotifier {
  final ExpenseService _service = ExpenseService();
  Expense_old _expense = Expense_old(name: '', price: 0.0);

  Expense_old get expense => _expense;

  set expense(Expense_old expense) {
    _expense = expense;
    notifyListeners();
  }

  Future<void> delete(String? uid) {
    return _service.delete(uid);
  }
}
