class LoginResponse {
  final String message;
  final bool status;

  LoginResponse({this.message, this.status});

  factory LoginResponse.fromJson(Map<String, dynamic> json){
    return LoginResponse(
        message: json['message'],
        status: json["status"]
    );
  }
}