import 'package:firebase_auth/firebase_auth.dart';

extension AuthExceptionExtension on FirebaseAuthException {
  String get messageException {
    switch (code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'invalid-email':
        return 'Thrown if the email address is not valid.';
      case 'user-disabled':
        return 'Thrown if the user corresponding to the given email has been disabled.';
      case 'missing-android-pkg-name':
        return 'An Android package name must be provided if the Android app is required to be installed.';
      case 'missing-continue-uri':
        return 'An Android package name must be provided if the Android app is required to be installed.';
      case 'missing-ios-bundle-id':
        return 'A continue URL must be provided in the request.';
      case 'invalid-continue-uri':
        return 'An iOS Bundle ID must be provided if an App Store ID is provided.';
      case 'unauthorized-continue-uri':
        return 'The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.';
      default:
        return 'Unknow exception';
    }
  }
}
