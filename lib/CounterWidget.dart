import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int initValue;


  @override
  State<StatefulWidget> createState() => _CounterWidgetState();

  CounterWidget(this.initValue);
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;
  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterWidget'),
      ),
      body: Center(
      child: Builder(builder: (context){
        return Column(
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  setState(() {
                    _counter++;
                  });
                },
                child: Text('add'),
                color: Colors.blue,
              ),
              Text('value : $_counter'),
              FlatButton(onPressed: (){
                /**
                 * 在Flutter开发中便有了一个默认的约定：如果StatefulWidget的状态是希望暴露出的，
                 * 应当在StatefulWidget中提供一个of静态方法来获取其State对象，开发者便可直接通过该方法来获取；
                 * 如果State不希望暴露，则不提供of方法。
                 */

             //   ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
                ScaffoldState _state = Scaffold.of(context);
                _state.showSnackBar(SnackBar(content: Text('I\'m SnackBar')));
              }, child: Text('show SnackBar'))
            ],
          );
      },)
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");

  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
