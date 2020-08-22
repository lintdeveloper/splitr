import 'package:splitr/models/api_response_model.dart';
import 'package:splitr/models/group/group.dart';

abstract class BaseGroup {
  Future<ApiResponse> createGroup({String email, Map groupRequest});
  Future<ApiResponse> addGroupMember({String email, String membersEmail, String group});
  Future<List<GroupList>> getGroupList({String email});
}