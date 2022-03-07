import 'package:firebase_auth/firebase_auth.dart';

extension StoreExceptionExtension on FirebaseException {
  String get messageException {
    switch (code) {
      // case 'user-not-found':
      //   return 'No user found for that email.';
      default:
        return 'Unknow exception';
    }
  }
}
