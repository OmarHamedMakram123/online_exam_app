import 'package:json_annotation/json_annotation.dart';

part 'success_auth_response_model.g.dart';

@JsonSerializable()
class SuccessAuthResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  SuccessAuthResponseModel ({
    this.message,
    this.token,
  });

  factory SuccessAuthResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SuccessAuthResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SuccessAuthResponseModelToJson(this);
  }
}


