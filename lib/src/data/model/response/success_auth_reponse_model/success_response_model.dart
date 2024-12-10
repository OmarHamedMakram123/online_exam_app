import 'package:json_annotation/json_annotation.dart';

part 'success_response_model.g.dart';

@JsonSerializable()
class SuccessResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  SuccessResponseModel ({
    this.message,
    this.token,
  });

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SuccessResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SuccessResponseModelToJson(this);
  }
}


