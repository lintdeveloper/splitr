import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:splitr/models/group/group.dart';
import 'package:splitr/models/models.dart';
import 'package:splitr/services/auth/base_auth.dart';
import 'package:splitr/services/groups/base_group.dart';
import 'package:splitr/utils/utils.dart';

class GroupsService implements BaseGroup {
  Map<String, String> _headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    "Accept": "application/json"
  };

  String msg;

  @override
  Future<ApiResponse> createGroup(String email, Map groupRequest) async {
    String url = BASE_URL + '/test/api/v1/users/$email/groups';
    final responsePayload = await http.post(url,
        headers: _headers,
        body: groupRequest);

    String responseUTF8 = utf8.decode(responsePayload.bodyBytes);
    final body = jsonDecode(responseUTF8);
    return ApiResponse.fromJson(body);
  }

  @override
  Future<ApiResponse> addGroupMember(String email, String memberEmail, String group) async {
    String url = BASE_URL + '/test/api/v1/users/$email/groups/members/$memberEmail/$group';
    final responsePayload = await http.post(url,
        headers: _headers);

    String responseUTF8 = utf8.decode(responsePayload.bodyBytes);
    final body = jsonDecode(responseUTF8);
    return ApiResponse.fromJson(body);
  }

  @override
  Future<List<GroupList>> getGroups(String _mail) async {
    String url = BASE_URL + '/test/api/v1/users/$_mail/groups';
    final responsePayload = await http.get(url,
        headers: _headers);
    String responseUTF8 = utf8.decode(responsePayload.bodyBytes);
    final body = jsonDecode(responseUTF8);
    return GroupResponse.fromJson(body).groupList;
  }
}