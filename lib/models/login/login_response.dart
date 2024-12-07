
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? status;
  String? message;
  String? accessToken;
  String? refreshToken;
  String? id;
  bool? admin;

  LoginResponse({
    this.status,
    this.message,
    this.accessToken,
    this.refreshToken,
    this.id,
    this.admin
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

