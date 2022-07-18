import 'package:flutter/foundation.dart';
import 'package:my_money/src/model/expense.dart';

class EditExpenseProvider extends ChangeNotifier {
  Expense expense = Expense(name: '', price: 0.0);
}
