import 'package:json_annotation/json_annotation.dart';

/// name : "John Smith"
/// email : "john@example.com"
@JsonSerializable()
class User {
  String _name;
  String _email;

  String get name => _name;
  String get email => _email;

  User(this._name, this._email);

  User.map(dynamic obj) {
    this._name = obj["name"];
    this._email = obj["email"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["email"] = _email;
    return map;
  }

}