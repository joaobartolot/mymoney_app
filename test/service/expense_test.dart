import 'package:flutter_test/flutter_test.dart';
import 'package:my_money/src/model/expense.dart';
import 'package:my_money/src/service/expense.dart';

void main() {
  final ExpenseService service = ExpenseService();

  group('Expense service', () {
    test('should create and save an expense in firestore', () async {
      Expense actual = await service.save('testing', 9.97);

      expect(actual.uid, isNotNull);
      expect(actual.name, 'testing');
      expect(actual.price, 9.97);
    });

    test('should delete an expense', () async {
      Expense expense = await service.save('testing', 123);

      await service.delete(expense.uid);

      var actual = await service.collectionRef.doc(expense.uid).get();

      expect(
        actual.exists,
        false,
      );
    });
  });

  test('should update an expense', () async {
    Expense expense = await service.save('testing', 123);

    expense.name = 'new testing';

    await service.update(expense);

    //   expect(
    //     actual.name,
    //     'new testing',
    //   );
  });
}
