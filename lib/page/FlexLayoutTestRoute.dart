import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexLayoutTestRoute extends StatefulWidget {
  static final String routerName = '/SwitchAndCheckBoxTestRoute';
  @override
  State<StatefulWidget> createState() => _FlexLayoutTestRoute();
}

class _FlexLayoutTestRoute extends State<FlexLayoutTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlexLayoutTestRoute'),
      ),
      body: Column(
        children: [
          Flex(
            direction: Axis.horizontal, //弹性布局的方向, Row默认为水平方向，Column默认为垂直方向
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  height: 30,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                  height: 30,
                ),
                flex: 2,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 200,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      height: 30,
                    ),
                    flex: 1,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      height: 30,
                    ),
                    flex: 2,
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
