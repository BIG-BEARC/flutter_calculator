import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/flutter_project/flutter_calculator/lib/page/scroll_widget/ListViewRoute.dart';
import 'package:flutter_calculator/page/scroll_widget/GridViewWidget.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 1;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard), //自定义图标
              color: Colors.white,
              onPressed: () {
                // 打开抽屉菜单 ,代码中打开抽屉菜单的方法在ScaffoldState中，通过Scaffold.of(context)可以获取父级最近的Scaffold 组件的State对象。
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        //导航栏
        title: Text('ScaffoldRoute'),
        centerTitle: true,
        actions: [
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
        bottom: TabBar(
          //生成Tab菜单
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: MyDraw(),
      /*  bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),

        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),*/
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home)),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      //PageView 组件，它和TabBarView功能相似
      body: TabBarView(
        /*       children: tabs.map((e){ //创建3个Tab页
        return Container(
          alignment: Alignment.center,
          child: Text(e, textScaleFactor: 5),
        );
      }).toList(),*/
        children: [GridViewWidget(),GridViewWidget2(),InfiniteGridView()],
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          //移除抽屉菜单顶部默认留白
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 38),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          width: 80,
                        ),
                      ),
                    ),
                    Text(
                      "Wendux",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Add account'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Manage accounts'),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
