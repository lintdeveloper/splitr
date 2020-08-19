import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:splitr/models/models.dart';
import 'package:splitr/services/auth/base-auth.dart';
import 'package:http/http.dart' as http;
import 'package:splitr/utils/custom_exception.dart';
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

    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      print(googleUser.displayName);

      final responsePayload = await http.post(url,
          headers: _headers,
          body: User(displayName: googleUser.displayName,
              photoUrl: googleUser.photoUrl,
              email: googleUser.email).toJson());

      if (responsePayload.statusCode != 200) {
        signOutWithGoogle(_googleSignIn, _auth);
        String responseUTF8 = utf8.decode(responsePayload.bodyBytes);
        final body = jsonDecode(responseUTF8);
        return ApiResponse.fromJson(body);
      }

      String responseUTF8 = utf8.decode(responsePayload.bodyBytes);
      final body = jsonDecode(responseUTF8);
      ApiResponse apiResponse = ApiResponse.fromJson(body);

      if (apiResponse.status) {
        final GoogleSignInAuthentication googleAuth = await googleUser
            .authentication;
        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);
        return apiResponse;
      } else {
        signOutWithGoogle(_googleSignIn, _auth);
        return apiResponse;
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