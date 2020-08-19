import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<bool>  signInWithGoogle(GoogleSignIn _googleSignIn);
  Future<void> signOutWithGoogle(GoogleSignIn _googleSignIn);
  Future<FirebaseUser> getCurrentUser();
}