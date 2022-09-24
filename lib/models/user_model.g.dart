// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      username: json['username'] as String,
      password: json['password'] as String,
      type: $enumDecode(_$UserTypeEnumMap, json['type']),
      tickets: (json['tickets'] as List<dynamic>?)
              ?.map((e) => TicketModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TicketModel>[],
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'type': _$UserTypeEnumMap[instance.type]!,
      'tickets': instance.tickets.map((e) => e.toJson()).toList(),
    };

const _$UserTypeEnumMap = {
  UserType.admin: 'admin',
  UserType.user: 'user',
};
