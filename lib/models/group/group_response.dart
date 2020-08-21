import 'package:splitr/models/member_response.dart';

class GroupResponse {
  final int id;
  final String name;
  final String amount;
  final BigInt creationDate;
  final List<MemberResponse> members;

  GroupResponse({this.id, this.name, this.amount, this.creationDate, this.members});
}

