import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipsRoute extends StatelessWidget {
  final String _text;

  TipsRoute(this._text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  Navigator.of(context).pop(['我是返回值'])
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
