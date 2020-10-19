import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/data/User.dart';
import 'package:fluttertoast/fluttertoast.dart';

///常用组件示例
///https://book.flutterchina.club/chapter3/buttons.html
///https://book.flutterchina.club/chapter3/text.html
class NormalWidget extends StatefulWidget {
  static final String routerName = '/NormalWidget';
  @override
  State<StatefulWidget> createState() => _NormalWidgetState();
}

class _NormalWidgetState extends State<NormalWidget> {
  double _sliderValue = 0;
  String jsonStr='[{"name":"Jack"},{"name":"Rose"}]';
  String jsonStr1= '{"name":"John Smith","email":"john@example.com"}';
  String content='';
  @override
  Widget build(BuildContext context) {
    //字体图标，https://material.io/resources/icons/
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return Scaffold(
      appBar: AppBar(
        title: Text('常用组件示例'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Text(
                  "Hello world" * 6, //字符串重复六次
                  textScaleFactor: 1.5, //代表文本相对于当前字体大小的缩放因子，它是调整字体大小的一个快捷方式。
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Hello world! I'm Jack." * 5,
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  maxLines: 1, //文本显示的最大行数
                  overflow:
                      TextOverflow.ellipsis, //多余的文本，可以通过overflow来指定截断方式，默认是直接截断
                ),
                Text(
                  'Hello world',
                  style: TextStyle(

                      //该属性和Text的textScaleFactor都用于控制字体大小。但是有两个主要区别：
                      //fontSize可以精确指定字体大小，而textScaleFactor只能通过缩放比例来控制。
                      //textScaleFactor主要是用于系统字体大小设置改变时对Flutter应用字体进行全局调整，而fontSize通常用于单个文本，字体大小不会跟随系统字体大小变化。
                      fontSize: 18.0,
                      //该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。
                      height: 1.2,
                      //由于不同平台默认支持的字体集不同，所以在手动指定字体时一定要先在不同平台测试一下。
                      fontFamily: "Courier",
                      color: Colors.blue,
                      background: Paint()..color = Colors.yellow,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed),
                ),
                Row(
                  children: [
                    RaisedButton(
                      child: Text("RaisedButton"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text("FlatButton"),
                      onPressed: () {},
                    ),
                    OutlineButton(
                      child: Text("OutlineButton"),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {},
                    ),
                    RaisedButton.icon(
                      icon: Icon(Icons.send),
                      label: Text("发送"),
                      onPressed: () {},
                    ),
                    OutlineButton.icon(
                      icon: Icon(Icons.add),
                      label: Text("添加"),
                      onPressed: () {},
                    ),
                    FlatButton.icon(
                      icon: Icon(Icons.info),
                      label: Text("详情"),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      child: Text("Submit"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {},
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      child: Text("Submit"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/1.png'),
                      width: 100,
                    ),
                    Image(
                      image: NetworkImage(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                      width: 100,
                    ),
                    Image(
                      image: NetworkImage(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                      width: 100.0,
                      color: Colors.blue,
                      colorBlendMode: BlendMode.difference,
                    ),
                    Image(
                      image: NetworkImage(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                      width: 100.0,
                      height: 200.0,
                      repeat: ImageRepeat.repeatY,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      icons,
                      style: TextStyle(
                          fontFamily: "MaterialIcons",
                          fontSize: 24.0,
                          color: Colors.green),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.accessible,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.error,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.fingerprint,
                      color: Colors.green,
                    ),
                  ],
                ),
                InkWell(
                  splashColor: Colors.orange,
                  onTap: () {},
                  child: Text('InkWell'),
                ),
                RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 16,
                              color: Colors.black45,
                            ),
                        children: [
                      TextSpan(
                          text: '沸腾',
                          style: TextStyle(color: Colors.red, fontSize: 12)),
                      TextSpan(text: ','),
                      TextSpan(text: '菊花不需要不能沸腾的员工'),
                      TextSpan(text: '沸腾，沸腾，沸腾，没有菊花，就没有明天'),
                      TextSpan(text: '沸腾，沸腾，沸腾，没有菊花，就没有明天'),
                      TextSpan(text: '沸腾，沸腾，沸腾，没有菊花，就没有明天'),
                      TextSpan(text: '沸腾，沸腾，沸腾，没有菊花，就没有明天'),
                      TextSpan(text: '沸腾，沸腾，沸腾，没有菊花，就没有明天'),
                      TextSpan(text: '沸腾，沸腾，沸腾，没有菊花，就没有明天'),
                    ])),
                Text.rich(TextSpan(
                    text: '登录即代表同意并阅读',
                    style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
                    children: [
                      TextSpan(
                        text: '《服务协议》',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Fluttertoast.showToast(msg: 'onTap');
                          },
                      )
                    ])),
                Text('值：$_sliderValue'),
                //Slider 滑块
                Slider(
                    value: _sliderValue,
                    onChanged: (v) {
                      setState(
                        () {
                          _sliderValue = v;
                        },
                      );
                    }),
                Card(
                  elevation: 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  color: Colors.blue,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.ac_unit),
                        title: Text('沸腾'),
                        subtitle: Text('龙岗无敌手'),
                      ),
                      ButtonBar(
                        children: [
                          FlatButton(onPressed: () {}, child: Text('251警告',style: TextStyle(color: Colors.white60),)),
                          FlatButton(onPressed: () {}, child: Text('战狼警告',style: TextStyle(color: Colors.white60)))
                        ],
                      ),
                    ],
                  ),
                ),
                FlatButton(onPressed: (){
                  setState(() {
                    //将JSON字符串转为Dart对象(此处是List)
                    List items = json.decode(jsonStr);
                    //这里获取到的对象为{"name":"Jack"}
                    content = items[0]['name'];
                  });
                }, child: Text('转换$content')),
                FlatButton(onPressed: (){
                  setState(() {
                    //将JSON字符串转为Dart对象(此处是List)
                    Map userMap = json.decode(jsonStr1);
                    //这里获取到的对象为{"name":"Jack"}
                    var user = User.fromJson(userMap);
                    setState(() {
                      content = user.name+'-'+user.email;
                      //要序列化一个user，我们只是将该User对象传递给该json.encode方法。
                      // 我们不需要手动调用toJson这个方法，因为`JSON.encode内部会自动调用。
                      print('序列化 user : '+json.encode(user));
                    });
                  });
                }, child: Text('转换$content'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
