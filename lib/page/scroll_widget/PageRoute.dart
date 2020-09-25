import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageRouteState();
}

class _PageRouteState extends State<PageRoute> {
  List<String> pageList = ['PageView1', 'PageView2', 'PageView3'];
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    /*  return Scaffold(
      body: PageView(
        //PageView滚动方向默认是水平，可以设置其为垂直方向：
        scrollDirection: Axis.horizontal,
        //PageView配合PageController可以实现非常酷炫的效果，控制每一个Page不占满，
        controller: PageController(
          viewportFraction: 0.9
        ),
        children: [
          MyPage1(),
          MyPage2(),
          MyPage3(),
        ],
        onPageChanged: (value) {},
      ),);*/
    return Center(
      child: Container(
        height: 230,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              itemBuilder: (context, index) {
                return _buildPageViewItem(pageList[index % pageList.length]);
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index% (pageList.length);
                });
              },
              itemCount: 1000,
            ),
            Positioned(
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(pageList.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPageIndex == index
                            ? Colors.blue
                            : Colors.grey
                      ),
                    );
                  }).toList(),
                ),
              ),
              bottom: 10,
              left: 0,
              right: 0,
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildPageViewItem(String content, {Color color = Colors.red}) {
  return Container(
    alignment: Alignment.center,
    color: color,
    child: Text(
      content,
      style: TextStyle(color: Colors.white, fontSize: 28),
    ),
  );
}

class MyPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.red,
    );
  }
}

class MyPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.yellow,
    );
  }
}

class MyPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.blue,
    );
  }
}
