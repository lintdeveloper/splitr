class RegisterRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String photoUrl;

  RegisterRequest({this.firstName, this.lastName, this.email, this.photoUrl});

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "photoUrl": photoUrl
  };
}
