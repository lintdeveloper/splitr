import 'package:flutter/foundation.dart';
import 'package:splitr/models/group/group.dart';
import 'package:splitr/models/models.dart';
import 'package:splitr/services/groups/groups.dart';

class GroupsProvider extends ChangeNotifier {
  GroupsService _groupsService;
  ApiResponse _response;
  List<GroupList> _groupList;


  GroupsProvider.instance()
    : _groupsService = GroupsService();


  Future<ApiResponse> createGroup({String email, Map groupRequest}) async {
      _response = await _groupsService.createGroup(email, groupRequest);
      return _response;
  }

  Future<List<GroupList>> getGroupList({String email}) async {
    _groupList = await _groupsService.getGroups(email);
    return _groupList;
  }
}