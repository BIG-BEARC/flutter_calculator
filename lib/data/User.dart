

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];
//要序列化一个user，我们只是将该User对象传递给该json.encode方法。
// 我们不需要手动调用toJson这个方法，因为`JSON.encode内部会自动调用。
  Map<String ,dynamic> toJson() =><String,dynamic>{
    'name':name,
  'email':email,
  };
}
