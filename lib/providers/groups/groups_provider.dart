import 'package:flutter/foundation.dart';
import 'package:splitr/models/models.dart';
import 'package:splitr/services/groups/groups.dart';

class GroupsProvider extends ChangeNotifier {
  GroupsService _groupsService;
  ApiResponse _response;

  GroupsProvider.instance()
    : _groupsService = GroupsService();


  Future<ApiResponse> createGroup({String email, GroupRequest groupRequest}) async {
      _response = await _groupsService.createGroup(email, groupRequest);
      return _response;
  }
}