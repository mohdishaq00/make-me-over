// import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';

class Authentication {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get CurrentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signing(_emil, _password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: _emil, password: _password);
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }

  Future<void> createuser(_email, _password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: _email, password: _password);
  }
}
