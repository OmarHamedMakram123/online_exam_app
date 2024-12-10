class ForgetPasswordResponseModel {
  final String message;
  final String info;

  ForgetPasswordResponseModel({required this.message, required this.info});


  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'info': info,
    };
  }
}
