import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 子 Widget 状态管理
class TapboxA extends StatefulWidget {
  static final  String  routerName = '/TapboxA' ;
  @override
  State<StatefulWidget> createState() => _TapboxAState();
/*   @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('TapboxA'),
      ),
      body: Center(
        child: Text('I\'m TapboxA '),
      ),
    );
  }*/

}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTrap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTrap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'InActive',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(color: _active?Colors.lightGreen[700]:Colors.grey[600]),
      ),
    );
  }
}
