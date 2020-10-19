import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapAndFlowWidget extends StatefulWidget {
  static final String routerName = '/SwitchAndCheckBoxTestRoute';
  @override
  State<StatefulWidget> createState() => _WrapAndFlowWidgetState();
}

class _WrapAndFlowWidgetState extends State<WrapAndFlowWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WrapAndFlowWidget'),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Wrap(
              spacing: 8.0, // 主轴(水平)方向间距
              runSpacing: 4.0, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: [
                Chip(
                  label: Text('Hamilton'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                ),
                Chip(
                  label: Text('Lafayette'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('M'),
                  ),
                ),
                Chip(
                  label: Text('Mulligan'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('H'),
                  ),
                ),
                Chip(
                  label: Text('Laurens'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('J'),
                  ),
                ),
                Chip(
                  label: Text('Romeo'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('F'),
                  ),
                ),
                Chip(
                  label: Text('Trump'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('T'),
                  ),
                ),
                Chip(
                  label: Text('Cameron'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('C'),
                  ),
                ),
                Chip(
                  label: Text('Laura'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('L'),
                  ),
                ),
                Flow(
                  delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                  children: <Widget>[
                    new Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.red,
                    ),
                    new Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.green,
                    ),
                    new Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.blue,
                    ),
                    new Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.yellow,
                    ),
                    new Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.brown,
                    ),
                    new Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.purple,
                    ),
                  ],
                ),
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.blue[200],
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[200],
                  child: Align(
                    widthFactor: 2,
                    heightFactor: 2,
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[200],
                  child: Align(
                    widthFactor: 2,
                    heightFactor: 2,
                    alignment: Alignment(2,0),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.blue[200],
                  child: Align(
                    alignment: FractionalOffset(0.2,0.3),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
