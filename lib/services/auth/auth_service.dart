import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:splitr/models/index.dart';
import 'package:splitr/services/auth/base_auth.dart';
import 'package:splitr/utils/utils.dart';

class AuthService implements BaseAuth {
  NetworkUtil _netUtil = new NetworkUtil();
  Map<String, String> _headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    "Accept": "application/json"
  };

  String msg;

  /// User sign in with a google account
  @override
  Future<ApiResponse> signInWithGoogle(GoogleSignIn _googleSignIn,
      FirebaseAuth _auth) async {
    const url = BASE_URL + '/test/api/v1/login';

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final responsePayload = await http.post(url,
        headers: _headers,
        body: User(
                displayName: googleUser.displayName,
                photoUrl: googleUser.photoUrl,
                email: googleUser.email)
            .toJson());

    String responseUTF8 = utf8.decode(responsePayload.bodyBytes);
    final body = jsonDecode(responseUTF8);
    ApiResponse apiResponse = ApiResponse.fromJson(body);

    if (apiResponse.status) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      return ApiResponse.fromJson(body);
    } else {
      signOutWithGoogle(_googleSignIn, _auth);
      return ApiResponse.fromJson(body);
    }
  }

  /// User setup account with google
  Future<ApiResponse> setUpWithGoogle(GoogleSignIn _googleSignIn, FirebaseAuth _auth) async {
    const url = BASE_URL + '/test/api/v1/register';

    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      final responsePayload = await http.post(url,
          headers: _headers,
          body: User(displayName: googleUser.displayName,
              photoUrl: googleUser.photoUrl,
              email: googleUser.email).toJson());


      String responseUTF8 = utf8.decode(responsePayload.bodyBytes);
      final body = jsonDecode(responseUTF8);
      ApiResponse apiResponse = ApiResponse.fromJson(body);

      if (apiResponse.status) {
        signOutWithGoogle(_googleSignIn, _auth);
        return ApiResponse.fromJson(body);
      } else {
        signOutWithGoogle(_googleSignIn, _auth);
        return ApiResponse.fromJson(body);
      }
    } catch (e) {
      print(e);
    }
  }

  /// User signs out
  @override
  Future<void> signOutWithGoogle(GoogleSignIn _googleSignIn,
      FirebaseAuth _auth,) async {
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
  Future firebaseLogin() {}

  /// Create groups to share bills
  Future createGroup() {}
}