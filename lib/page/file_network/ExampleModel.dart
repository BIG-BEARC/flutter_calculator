
import 'package:json_annotation/json_annotation.dart';

part 'ExampleModel.g.dart';
@JsonSerializable()
class ExampleModel{
  String name;
  String address;
  int age;

  ExampleModel(this.name, this.address, this.age);
  //不同的类使用不同的mixin即可,
  factory ExampleModel.fromJson(Map<String,dynamic> json) => _$ExampleModelFromJson(json);
  Map<String, dynamic> toJson()=>_$ExampleModelToJson(this);

}