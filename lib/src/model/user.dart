import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User({
    required this.userId,
    required this.name,
  });

  @JsonKey(name: 'user_id')
  final String userId;
  final String name;
}

@Collection<User>('users')
final usersRef = UserCollectionReference();
