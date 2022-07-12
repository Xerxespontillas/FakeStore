 import 'package:json_annotation/json_annotation.dart';

 part 'User.g.dart';
@JsonSerializable()
class User {
  int id;
  String email;
  String username;
  String password;
  Map<String, String> name;
  Map<String, dynamic>? address;
  String? phone;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    this.address,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() =>_$UserToJson(this);
}