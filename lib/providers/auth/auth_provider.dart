import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:splitr/enums/auth_status.dart';
import 'package:splitr/models/api_response_model.dart';
import 'package:splitr/providers/auth/index.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn;
  Status _status = Status.Uninitialized;
  AuthService _authService;

  AuthProvider.instance()
      : _auth = FirebaseAuth.instance,
        _authService = AuthService(),
        _googleSignIn = GoogleSignIn() {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Status get status => _status;

  FirebaseUser get user => _user;
  ApiResponse _response;

  /// User sign in with a google account
  @override
  Future<ApiResponse> signInWithGoogle() async {
    try {
      setStatus(Status.Authenticating);
      _response = await _authService.signInWithGoogle(_googleSignIn, _auth);

      return _response;
    } catch (e) {
      setStatus(Status.Unauthenticated);
    }
  }

  /// User setup and account with google
  Future<ApiResponse> setUpWithGoogle() async {
    try {
      _status = Status.AccountSettingUp;
      notifyListeners();
      _response = await _authService.setUpWithGoogle(_googleSignIn, _auth);
      print(_response.status);
      return _response;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
    }
  }

  /// Set app status
  void setStatus(Status status) {
    _status = status;
    notifyListeners();
  }

  /// User signs out of google account
  @override
  Future<void> signOutWithGoogle() async {
    _authService.signOutWithGoogle(_googleSignIn, _auth);
    setStatus(Status.Unauthenticated);
    return Future.delayed(Duration.zero);
  }

  /// Gets the current user
  @override
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  /// Auth State Change event
  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      setStatus(Status.Unauthenticated);
    } else {
      _user = firebaseUser;
      setStatus(Status.Authenticated);
    }
  }
}
