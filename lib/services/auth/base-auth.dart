import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:splitr/models/api_response_model.dart';

abstract class BaseAuth {
  Future<ApiResponse>  signInWithGoogle(GoogleSignIn _googleSignIn, FirebaseAuth _auth);
  Future<void> signOutWithGoogle(GoogleSignIn _googleSignIn, FirebaseAuth _auth);
  Future<FirebaseUser> getCurrentUser(FirebaseAuth _auth);
}