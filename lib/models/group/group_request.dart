class GroupRequest {
  final String name;
  final String amount;

  GroupRequest({this.name, this.amount});

  Map<String, dynamic> toJson() => {"name": name, "amount": amount};
}
