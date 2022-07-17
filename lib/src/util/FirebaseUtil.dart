import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtil {
  static String getCollectionPath(String path) {
    final String userUid = FirebaseAuth.instance.currentUser?.uid ?? '';
    return 'users/$userUid/$path';
  }
}
