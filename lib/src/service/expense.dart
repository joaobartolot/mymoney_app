import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:my_money/src/model/expense.dart';
import 'package:my_money/src/model/expense_old.dart';
import 'package:my_money/src/util/firebase_util.dart';

class ExpenseService {
  final Logger _logger = Logger();

  FirebaseFirestore get firestore => FirebaseUtil.getFirestore();

  CollectionReference get collectionRef =>
      firestore.collection(FirebaseUtil.getCollectionPath('expense'));

  Future<ExpenseDocumentReference> save(String name, double price) {
    Expense expense = Expense(
      userId: FirebaseAuth.instance.currentUser!.uid,
      name: name,
      price: price,
      createdAt: DateTime.now(),
    );

    Future<ExpenseDocumentReference> future = expenseRef.add(expense);

    future
        .then((value) => _logger.d('Expense added'))
        .onError((error, stackTrace) => _logger.e(
              'Something went wrong',
              error,
              stackTrace,
            ));

    return future;
  }

  ExpenseQuery getAllFromUser() {
    return expenseRef.whereUserId(
        isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  }

  Future<List<Expense_old>> getAll() {
    Completer<List<Expense_old>> completer = Completer();

    collectionRef.orderBy('created_at').snapshots().listen((event) {
      List<Expense_old> expenses = event.docs.map((e) {
        var data = e.data() as Map<String, dynamic>;
        return Expense_old.fromMap(e.id, data);
      }).toList();
      completer.complete(expenses);
    });

    return completer.future;
  }

  Future<void> delete(String? uid) {
    return collectionRef.doc(uid).delete();
  }

  Future<void> update(Expense_old expense) {
    return collectionRef.doc(expense.uid).update(expense.toMap());
  }

  Future<Expense_old> getById(String id) {
    Completer<Expense_old> completer = Completer();

    collectionRef.doc(id).snapshots().listen(
      (documentSnapshot) {
        if (documentSnapshot.data() != null) {
          Map<String, dynamic> data =
              (documentSnapshot.data() as Map<String, dynamic>);

          completer.complete(Expense_old.fromMap(documentSnapshot.id, data));
        }
      },
    );

    return completer.future;
  }
}
