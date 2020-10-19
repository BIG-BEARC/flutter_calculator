import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  static final String routerName = '/ScrollControllerTestRoute';
  @override
  State<StatefulWidget> createState() => _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;
@override
  void dispose() {
    super.dispose();
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
  }
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动控制'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          key: PageStorageKey(1),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
            );
          },
          controller: _controller,
          itemExtent: 50,
          itemCount: 100,
        ),
      ),
      floatingActionButton: showToTopBtn?FloatingActionButton(onPressed: (){
        _controller.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.ease);
      },child: Icon(Icons.arrow_upward),):null,
    );
  }
}
