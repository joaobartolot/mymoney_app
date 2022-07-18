import 'package:flutter/foundation.dart';
import 'package:my_money/src/model/expense.dart';

class HomeProvider extends ChangeNotifier {
  List<Expense> _expenses = List.empty();

  List<Expense> get expenses => _expenses;

  set expenses(List<Expense> expenses) {
    _expenses = expenses;
    notifyListeners();
  }
}
