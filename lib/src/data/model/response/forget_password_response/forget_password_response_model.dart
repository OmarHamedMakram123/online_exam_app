/// message : "success"
/// info : "OTP sent to your email"

class ForgetPasswordResponseModel {
  ForgetPasswordResponseModel({
      this.message, 
      this.info,});

  ForgetPasswordResponseModel.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
  }
  String? message;
  String? info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    return map;
  }

}