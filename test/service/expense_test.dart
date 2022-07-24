import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_money/src/service/expense.dart';

void main() {
  final ExpenseService service = ExpenseService();

  group('Expense service', () {
    test('should create and save an expense in firestore', () async {
      DocumentReference<Object?> documentReference =
          await service.save('testing', 9.97);
      var actual = await documentReference.get();

      expect(actual.id, isNotNull);
      expect(actual.get('name'), 'testing');
      expect(actual.get('price'), 9.97);
    });

    test('should delete an expense', () async {
      DocumentReference<Object?> documentReference =
          await service.save('testing', 123);

      await service.delete(documentReference.id);

      var actual = await service.collectionRef.doc(documentReference.id).get();

      expect(
        actual.exists,
        false,
      );
    });
  });
}
