class LoginRequest {
  String? email;
  LoginRequest({required this.email});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["email"] = email;
    return map;
  }
}
