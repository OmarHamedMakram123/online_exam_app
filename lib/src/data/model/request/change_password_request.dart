/// oldPassword : "Elevate@123"
/// password : "Elevate@1234"
/// rePassword : "Elevate@1234"

class ChangePasswordRequest {
  ChangePasswordRequest({
      this.oldPassword, 
      this.password, 
      this.rePassword,});

  String? oldPassword;
  String? password;
  String? rePassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oldPassword'] = oldPassword;
    map['password'] = password;
    map['rePassword'] = rePassword;
    return map;
  }

}