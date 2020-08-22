import 'package:flutter/foundation.dart';
import 'package:splitr/models/group/group.dart';
import 'package:splitr/models/index.dart';
import 'package:splitr/providers/groups/base_group.dart';
import 'package:splitr/services/groups/groups.dart';

class GroupsProvider extends BaseGroup with ChangeNotifier {
  GroupsService _groupsService;
  ApiResponse _response;
  List<GroupList> _groupList;
  String _group;

  set setGroupId(String val) {
    _group = val.trim();
    notifyListeners();
  }

  String get groupId => _group;

  GroupsProvider.instance()
    : _groupsService = GroupsService();


  Future<ApiResponse> createGroup({String email, Map groupRequest}) async {
      _response = await _groupsService.createGroup(email, groupRequest);
      return _response;
  }

  Future<ApiResponse> addGroupMember({String email, String membersEmail, String group}) async {
    _response = await _groupsService.addGroupMember(email, membersEmail, group);
    return _response;
  }

  Future<List<GroupList>> getGroupList({String email}) async {
    _groupList = await _groupsService.getGroups(email);
    return _groupList;
  }
}