import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///参数传递练习1
class TipsRoute extends StatelessWidget {
  static const String routerName = '/TipsRoute';
  final String _text;

  TipsRoute(this._text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.of(context).pop('点击 title 中 back icon 返回 ');
        }),
        title: Text('TipsRoute'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('receiver text: $_text '),
              FlatButton(
                onPressed: () => {
                  Navigator.of(context).pop('我是返回值')
                },
                child: Text('pop TipRoute'),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
