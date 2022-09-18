import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_money/src/model/user.dart';

class UserService {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  CollectionReference get collectionRef => firestore.collection("user");
  saveUser() {
    User user = User(name: "john");

    usersRef.add(user);
  }
}
