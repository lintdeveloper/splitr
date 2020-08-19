class GroupRequest {
  final String name;
  final String amount;

  GroupRequest({this.name, this.amount});

  factory GroupRequest.fromJson(Map<String, dynamic> json){
    return GroupRequest(
        name: json['name'],
        amount: json["amount"]
    );
  }
}