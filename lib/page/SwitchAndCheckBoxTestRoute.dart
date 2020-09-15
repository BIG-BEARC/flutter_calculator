import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchAndCheckBoxTestRoute'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _checkboxSelected,
                    onChanged: (value) {
                      setState(() {
                        _checkboxSelected = value;
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  Switch(
                      value: _switchSelected,
                      onChanged: (value) {
                        setState(() {
                          _switchSelected = value;
                        });
                      }),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
