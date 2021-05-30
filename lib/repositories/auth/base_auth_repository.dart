import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepository {
  // this user getter is a user getter that is constantly listening to our
  // current authentication state. This method will give us a new firebase
  // user or no firebase user
  Stream<auth.User> get user;
  Future<auth.User> signUpWithEmailAndPassword({
    String username,
    String email,
    String password,
  });
  Future<auth.User> logInWithEmailAndPassword({
    String email,
    String password,
  });
  Future<void> logOut();
}
