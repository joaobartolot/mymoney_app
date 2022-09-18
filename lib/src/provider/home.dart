import 'package:flutter/foundation.dart';
import 'package:my_money/src/model/expense_old.dart';

class HomeProvider extends ChangeNotifier {
  List<Expense_old> _expenses = List.empty();

  List<Expense_old> get expenses => _expenses;

  set expenses(List<Expense_old> expenses) {
    _expenses = expenses;
    notifyListeners();
  }
}
