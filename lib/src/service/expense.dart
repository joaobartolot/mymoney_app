import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:my_money/src/model/expense.dart';
import 'package:my_money/src/util/FirebaseUtil.dart';

class ExpenseService {
  final Logger _logger = Logger();

  final CollectionReference _collectionRef = FirebaseFirestore.instance
      .collection(FirebaseUtil.getCollectionPath('expense'));

  Future<DocumentReference<Object?>> save(String name, double price) {
    Expense expense = Expense(
      name: name,
      price: price,
      createdAt: DateTime.now(),
    );

    var addResponse = _collectionRef.add(expense.toMap());

    addResponse
        .then((value) => _logger.i('Expense saved: $value'))
        .onError((error, stackTrace) => _logger.e(error.toString()));

    return addResponse;
  }

  Stream<List<Expense>> getAll() {
    return _collectionRef.orderBy('created_at').snapshots().asyncMap((event) {
      List<Expense> expenses = event.docs.map((e) {
        var data = e.data() as Map<String, dynamic>;
        return Expense.fromMap(e.id, data);
      }).toList();

      return expenses;
    });
  }
}
