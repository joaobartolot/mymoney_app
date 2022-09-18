import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_money/src/model/expense_old.dart';

void main() {
  group('Expense Model', () {
    test('should create a map when toMap is called', () {
      final Expense_old expense = Expense_old(name: 'testing', price: 0);
      final DateTime now = DateTime.now();
      expense.createdAt = now;

      expect(
        expense.toMap(),
        {
          'name': 'testing',
          'price': 0.0,
          'created_at': now,
        },
      );
    });

    test('should create an Expense class when fromMap is called', () {
      final Timestamp now = Timestamp.now();

      final Expense_old actual = Expense_old.fromMap(
        '123',
        {
          'name': 'testing',
          'price': 0.0,
          'created_at': now,
        },
      );

      expect(actual.uid, '123');
      expect(actual.name, 'testing');
      expect(actual.price, 0.0);
      expect(actual.createdAt, now.toDate());
    });
  });
}
