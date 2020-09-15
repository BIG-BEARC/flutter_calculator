import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC(this.active, this.onChanged);

  @override
  State<StatefulWidget> createState() => _TapboxCState();
/*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TapboxC '),
      ),
      body: Center(
        child: Text('I\'m TapboxC  '),
      ),
    );
  }*/

}

class _TapboxCState extends State<TapboxC> {
  bool _highLight = false;

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highLight = true;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      onTapUp: _handleTapUp,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.black)),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: _highLight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
