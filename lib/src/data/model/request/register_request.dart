class RegisterRequest {
  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;

  RegisterRequest({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["username"] = username;
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["email"] = email;
    map["password"] = password;
    map["rePassword"] = rePassword;
    map["phone"] = phone;
    return map;
  }
}
