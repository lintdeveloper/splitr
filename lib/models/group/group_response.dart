class GroupResponse {
  bool status;
  List<GroupList> groupList;

  GroupResponse({this.status, this.groupList});

  GroupResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['groups'] != null) {
      groupList = new List<GroupList>();
      json['groups'].forEach((v) {
        groupList.add(new GroupList.fromJson(v));
      });
    }
  }
}

class GroupList {
  int id;
  String name;
  String amount;
  int creationDate;
  List<Member> members;

  GroupList({this.id, this.name, this.amount, this.creationDate, this.members});

  GroupList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    creationDate = json['creationDate'];
    if (json['members'] != null) {
      members = new List<Member>();
      json['members'].forEach((v) {
        members.add(new Member.fromJson(v));
      });
    }
  }
}

class Member {
  String email;
  String amount;
  String photoUrl;
  int creationDate;
  String displayName;

  Member.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    amount = json['amount'];
    photoUrl = json["photoUrl"];
    creationDate = json['creationDate'];
    displayName = json['displayName'];
  }
}
