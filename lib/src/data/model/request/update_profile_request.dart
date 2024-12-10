class UpdateProfileRequest{
  String username;
  String firstName;
  String lastName;
  String email;
  String phone;


  UpdateProfileRequest({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
});


  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["username"] = username;
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["email"] = email;
    map["phone"] = phone;
    return map;
  }
}