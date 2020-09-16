import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('容器组件'),
        actions: [
          //UnconstrainedBox不会对子组件产生任何限制，它允许其子组件按照其本身大小绘制。但在"去除"多重限制的时候也许会有帮助
          //“去除”父元素的限制
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          ),
          /*      CircularProgressIndicator(
           strokeWidth: 3,
           valueColor: AlwaysStoppedAnimation(Colors.white70),
         ),*/
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: <Widget>[
              //ConstrainedBox用于对子组件添加额外的约束。例如，如果你想让子组件的最小高度是80像素，
              // 你可以使用const BoxConstraints(minHeight: 80.0)作为子组件的约束。
              ConstrainedBox(
                //BoxConstraints用于设置限制条件
                constraints: BoxConstraints(
                  minHeight: 50, //最小高度为50像素
                  minWidth: double.infinity, //宽度尽可能大
                ),
                //可以看到，我们虽然将Container的高度设置为5像素，但是最终却是50像素，这正是ConstrainedBox的最小高度限制生效了。
                child: Container(
                  height: 5,
                  child: redBox,
                ),
              ),
              //Padding可以给其子节点添加填充（留白），和边距效果类似
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    //SizedBox用于给子元素指定固定的宽高
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: redBox,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 10),
                    //多重限制，对于minWidth和minHeight来说，是取父子中相应数值较大的，对于maxWidth和maxHeight,则正好相反
                    // 实际上，只有这样才能保证父限制与子限制不冲突。
                    child: ConstrainedBox(
                        constraints:
                        BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                        child: ConstrainedBox(
                          constraints:
                          BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                          child: redBox,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 10),
                    //DecoratedBox可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等。
                    child: DecoratedBox(
                      //BoxDecoration类，它是一个Decoration的子类，实现了常用的装饰元素的绘制。
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.orange[700]]), //背景渐变
                          borderRadius: BorderRadius.circular(3.0), //3像素圆角
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(2, 2),
                                blurRadius: 4.0)
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80.0, vertical: 18.0),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Container(
                      color: Colors.black,
                      child: Transform(
                        alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                        transform: Matrix4.skewY(0.3),
                        child: new Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.deepOrange,
                            child: const Text('Apartment for rent!')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 50),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      //默认原点为左上角，左移20像素，向上平移5像素
                      child: Transform.translate(
                        offset: Offset(-20, -5),
                        child: Text("Hello world"),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Transform.rotate(
                    //旋转90度
                    angle: math.pi / 2,
                    child: Text("Hello world"),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Transform.scale(
                        //放大到1.5倍
                        scale: 1.5,
                        child: Text("Hello world"),
                      ),
                    ),
                  ),
                  //tips:Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，
                  // 其占用空间的大小和在屏幕上的位置都是固定不变的，
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DecoratedBox(
                            decoration: BoxDecoration(color: Colors.red),
                            child: Transform.scale(
                                scale: 1.5, child: Text("Hello world"))),
                        Text(
                          "你好",
                          style: TextStyle(color: Colors.green, fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20,left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                        decoration: BoxDecoration(color: Colors.red),
                        //RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，
                        // 但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。
                        child: RotatedBox(
                           //旋转90度(1/4圈)
                            quarterTurns: 1,
                            child: Text("Hello world"))),
                    Text(
                      "你好",
                      style: TextStyle(color: Colors.green, fontSize: 18.0),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50,left: 120),
                padding: EdgeInsets.only(top: 10,left: 10),
                constraints: BoxConstraints.tightFor(width: 200,height: 150),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red,Colors.orange]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0,2.0),
                      blurRadius: 4.0
                    ),
                  ],
                ),
                transform: Matrix4.rotationZ(.2), //卡片倾斜变换
                alignment: Alignment.center, //卡片内文字居中
                child: Text( //卡片文字
                  "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
