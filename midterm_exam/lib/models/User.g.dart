// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      name: Map<String, String>.from(json['name'] as Map),
      address: json['address'] as Map<String, dynamic>?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
    };
