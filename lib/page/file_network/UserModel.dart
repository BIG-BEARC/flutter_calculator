import 'package:json_annotation/json_annotation.dart';

/// name : "John Smith"
/// email : "john@example.com"
part 'UserModel.g.dart';
@JsonSerializable()
class UserModel {
  String name;
  String email;

  UserModel(this.name, this.email);
  //不同的类使用不同的mixin即可,
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
