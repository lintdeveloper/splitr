import 'package:splitr/models/group/group.dart';
import 'package:splitr/models/index.dart';

abstract class BaseGroup {
  Future<List<GroupList>>  getGroups(String email);
  Future<ApiResponse> createGroup(String email, Map groupRequest);

}