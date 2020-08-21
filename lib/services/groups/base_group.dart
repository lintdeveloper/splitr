import 'package:splitr/models/models.dart';

abstract class BaseGroup {
  Future<List<GroupResponse>>  getGroups(String email);
  Future<ApiResponse> createGroup(String email, Map groupRequest);

}