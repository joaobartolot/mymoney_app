import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  Expense({
    this.uid,
    required this.name,
    required this.price,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'created_at': createdAt,
    };
  }

  final String? uid;
  String name;
  double price;
  DateTime? createdAt;

  static Expense fromMap(String? uid, Map<String, dynamic> data) {
    return Expense(
        uid: uid ?? '',
        name: data['name'],
        price: data['price'],
        createdAt: (data['created_at'] as Timestamp).toDate());
  }
}
