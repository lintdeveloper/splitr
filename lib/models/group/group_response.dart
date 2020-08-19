class GroupResponse {
  final String message;
  final bool status;

  GroupResponse({this.message, this.status});

  factory GroupResponse.fromJson(Map<String, dynamic> json){
    return GroupResponse(
        message: json['message'],
        status: json["status"]
    );
  }
}