// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      profile: json['profile'] == null
          ? null
          : ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      admin: json['admin'] as bool?,
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'profile': instance.profile,
      'admin': instance.admin,
    };

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) =>
    AccountResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => AccountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DetailAccountResponse _$DetailAccountResponseFromJson(
        Map<String, dynamic> json) =>
    DetailAccountResponse(
      data: json['data'] == null
          ? null
          : AccountModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailAccountResponseToJson(
        DetailAccountResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
