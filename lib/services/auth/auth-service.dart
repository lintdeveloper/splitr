import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:splitr/services/auth/base-auth.dart';

class AuthService implements BaseAuth {

  /// User sign in with a google account
  @override
  Future<bool> signInWithGoogle( GoogleSignIn _googleSignIn, FirebaseAuth _auth) async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// User signs out
  @override
  Future<void> signOutWithGoogle(GoogleSignIn _googleSignIn, FirebaseAuth _auth) async {
    _auth.signOut();
    _googleSignIn.signOut();
    return Future.delayed(Duration.zero);
  }

  /// Gets the current user
  @override
  Future<FirebaseUser> getCurrentUser(FirebaseAuth _auth) async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  /// Save user in FireStore
  Future<bool> saveUser() {}

  /// Logs user using FireStore
  Future  firebaseLogin() {}

  /// Create groups to share bills
  Future createGroup() {}
}
