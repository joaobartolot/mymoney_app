import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User({
    required this.name,
  });

  final String name;
}

@Collection<User>('users')
final usersRef = UserCollectionReference();
