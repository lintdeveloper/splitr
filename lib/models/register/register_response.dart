class RegisterResponse {
  final String message;
  final bool status;

  RegisterResponse({this.message, this.status});

  factory RegisterResponse.fromJson(Map<String, dynamic> json){
    return RegisterResponse(
        message: json['message'],
        status: json["status"]
    );
  }
}