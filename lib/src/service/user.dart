import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  CollectionReference get collectionRef => firestore.collection("user");
  saveUser() {}
}
