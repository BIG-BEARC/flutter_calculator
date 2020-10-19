import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OriginalPointEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OriginalPointEventState();
}

class _OriginalPointEventState extends State<OriginalPointEvent> {
  //定义一个状态，保存当前指针位置
  PointerEvent _event;
  String _operation = "No Gesture detected!"; //保存事件名
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('原始监听和手势监听'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildPointerTest(),
              Container(
                color: Colors.yellow,
                padding: EdgeInsets.only(top: 10),
                child: Listener(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300.0, 150.0)),

                      child: Center(child: Text("Box A")),
                    ),
                    //只有点击文本内容区域才会触发点击事件，
                    // 因为 deferToChild 会去子组件判断是否命中测试，
                    // 而该例中子组件就是 Text("Box A") 。
                    // 如果我们想让整个300×150的矩形区域都能点击我们可以将behavior设为HitTestBehavior.opaque。
                    // 注意，该属性并不能用于在组件树中拦截（忽略）事件，它只是决定命中测试时的组件大小。
                    // behavior: HitTestBehavior.opaque,
                    onPointerDown: (event) => print("down A")),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                width: double.infinity,
                color: Colors.red[300],
                child: Stack(
                  children: <Widget>[
                    Listener(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                        child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.blue)),
                      ),
                      onPointerDown: (event) => print("down0"),
                    ),
                    Listener(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                        child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                      ),
                      onPointerDown: (event) => print("down text"),
                      // behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 100,
                    color: Colors.blue,
                    child: Text(
                      _operation,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  onDoubleTap: () => {
                    _updateText('DoubleTap'),
                  },
                  onLongPress: () => _updateText('LongPress'),
                  //当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，会有200毫秒左右的延时，
                  // 这是因为当用户点击完之后很可能会再次点击以触发双击事件，所以GestureDetector会等一段时间来确定是否为双击事件。
                  // 如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时。
                  onTap: () => _updateText('Tap'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Container buildPointerTest() {
    return Container(
              child: Listener(
                child: Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    width: double.infinity,
                    height: 150,
                    child: Text(
                      _event?.toString() ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onPointerCancel: (cancelEvent) =>
                    setState(() => {_event = cancelEvent}),
                onPointerDown: (downEvent) =>
                    setState(() => _event = downEvent),
                onPointerMove: (moveEvent) =>
                    setState(() => _event = moveEvent),
                onPointerUp: (upEvent) => setState(() => _event = upEvent),
                onPointerSignal: (signalEvent) =>
                    setState(() => _event = signalEvent),
              ),
            );
  }

  _updateText(String content) {
    //更新显示的事件名
    setState(() {
      _operation = content;
    });
  }
}
