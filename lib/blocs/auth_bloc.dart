import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza_app_s/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends BlocBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _exceptionController =
      BehaviorSubject<FirebaseAuthException?>.seeded(null);
  Stream<FirebaseAuthException?> get onExceptionChange =>
      _exceptionController.stream;

  void clearException() => _exceptionController.sink.add(null);
  void setException(FirebaseAuthException exception) =>
      _exceptionController.sink.add(exception);

  User? get currentUser => _auth.currentUser;

  Future<UserCredential?> signIn() async {
    try {
      return await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      setException(e);
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      setException(e);
    }
  }

  @override
  void dispose() {
    _exceptionController.close();
  }

  @override
  void initState() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
