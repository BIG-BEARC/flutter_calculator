import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///常用组件示例
///https://book.flutterchina.club/chapter3/buttons.html
///https://book.flutterchina.club/chapter3/text.html
class NormalWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NormalWidgetState();
}

class _NormalWidgetState extends State<NormalWidget> {
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
      body: Container(
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
                  Icon(Icons.accessible,color: Colors.green,),
                  Icon(Icons.error,color: Colors.green,),
                  Icon(Icons.fingerprint,color: Colors.green,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
