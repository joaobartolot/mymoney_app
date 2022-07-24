import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:my_money/src/model/expense.dart';
import 'package:my_money/src/util/firebase_util.dart';

class ExpenseService {
  final Logger _logger = Logger();

  FirebaseFirestore get firestore => FirebaseUtil.getFirestore();

  CollectionReference get collectionRef =>
      firestore.collection(FirebaseUtil.getCollectionPath('expense'));

  Future<Expense> save(String name, double price) {
    Expense expense = Expense(
      name: name,
      price: price,
      createdAt: DateTime.now(),
    );

    var addResponse = collectionRef.add(expense.toMap());

    addResponse
        .then((value) => _logger.i('Expense saved: $value'))
        .onError((error, stackTrace) => _logger.e(error.toString()));

    Completer<Expense> completer = Completer();

    addResponse
        .then((docRef) => docRef.get().then((documentSnapshot) {
              if (documentSnapshot.data() != null) {
                Map<String, dynamic> data =
                    (documentSnapshot.data() as Map<String, dynamic>);

                _logger.i('Expense saved: $data');

                completer.complete(Expense.fromMap(documentSnapshot.id, data));
              }
            }).onError((error, stackTrace) {
              _logger.e(stackTrace);

              completer.completeError(error ?? 'Something went wrong!');
            }))
        .onError((error, stackTrace) {
      _logger.e(stackTrace);
      completer.completeError(error ?? 'Something went wrong!');
    });

    return completer.future;
  }

  Future<List<Expense>> getAll() {
    Completer<List<Expense>> completer = Completer();

    collectionRef.orderBy('created_at').snapshots().listen((event) {
      List<Expense> expenses = event.docs.map((e) {
        var data = e.data() as Map<String, dynamic>;
        return Expense.fromMap(e.id, data);
      }).toList();
      completer.complete(expenses);
    });

    return completer.future;
  }

  Future<void> delete(String? uid) {
    return collectionRef.doc(uid).delete();
  }

  Future<void> update(Expense expense) {
    return collectionRef.doc(expense.uid).update(expense.toMap());
  }

  Future<Expense> getById(String id) {
    Completer<Expense> completer = Completer();

    collectionRef.doc(id).snapshots().listen(
      (documentSnapshot) {
        if (documentSnapshot.data() != null) {
          Map<String, dynamic> data =
              (documentSnapshot.data() as Map<String, dynamic>);

          completer.complete(Expense.fromMap(documentSnapshot.id, data));
        }
      },
    );

    return completer.future;
  }
}
