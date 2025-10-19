import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';
@JsonSerializable()
class SignUpResponse {
    SignUpResponse({
        this.message,
        this.userData,
        this.status,
        this.code,
    });

    final String? message;
    @JsonKey(name: 'data')
    final UserData? userData;

    final bool? status;

    final int? code;

    factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);

    Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);

}

@JsonSerializable()
class UserData {
    UserData({
        this.token,
        this.username,
    });

    final String? token;

    final String? username;

    factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

    Map<String, dynamic> toJson() => _$UserDataToJson(this);

}