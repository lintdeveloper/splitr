import 'package:firebase_auth/firebase_auth.dart';
import 'package:splitr/enums/index.dart';
import 'package:splitr/models/api_response_model.dart';

abstract class BaseAuth {
  Future<ApiResponse>  signInWithGoogle();
  Future<void> signOutWithGoogle();
  Future<FirebaseUser> getCurrentUser();
  Future<void> setStatus(Status status);
}