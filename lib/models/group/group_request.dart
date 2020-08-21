class GroupRequest {
  final String name;
  final String amount;

  GroupRequest({this.name, this.amount});

  Map<String, dynamic>  toJson() {
    return <String, dynamic> {
      "name": name,
      "amount": amount
    };
  }
}