import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtil {
  static FirebaseFirestore getFirestore() {
    // if (Platform.environment.containsKey('FLUTTER_TEST')) {
    //   return FakeFirebaseFirestore();
    // }

    return FirebaseFirestore.instance;
  }

  static User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  static String getCollectionPath(String path) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return path;

    final String userUid = FirebaseAuth.instance.currentUser?.uid ?? 'uid';
    return 'users/$userUid/$path';
  }
}
