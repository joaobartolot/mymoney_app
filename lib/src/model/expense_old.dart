import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class Expense_old {
  Expense_old({
    this.uid,
    required this.name,
    required this.price,
    this.createdAt,
  });

  @JsonKey(ignore: true)
  final String? uid;
  String name;
  double price;
  DateTime? createdAt;

  @override
  Expense_old.fromMap(String? uid, Map<String, dynamic> data)
      : uid = uid ?? '',
        name = data['name'],
        price = data['price'],
        createdAt = (data['created_at'] as Timestamp).toDate();

  @override
  Map<String, dynamic> toMap() => {
        'name': name,
        'price': price,
        'created_at': createdAt,
      };

  // static Expense fromMap(String? uid, Map<String, dynamic> data) {
  //   return Expense(
  //       uid: uid ?? '',
  //       name: data['name'],
  //       price: data['price'],
  //       createdAt: (data['created_at'] as Timestamp).toDate());
  // }
}
