import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense.g.dart';

@JsonSerializable(explicitToJson: true)
class Expense {
  Expense({
    required this.userId,
    required this.name,
    required this.price,
    this.createdAt,
  });

  @JsonKey(name: 'user_id')
  final String userId;
  final String name;
  final double price;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
}

@Collection<Expense>('expenses')
final expenseRef = ExpenseCollectionReference();
