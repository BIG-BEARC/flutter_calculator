import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderAndStreamBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FutureBuilderAndStreamBuilderState();
}

class _FutureBuilderAndStreamBuilderState
    extends State<FutureBuilderAndStreamBuilder>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('异步UI更新', style: TextStyle(fontSize: 18)),
              Text(
                '（FutureBuilder、StreamBuilder）',
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: 'FutureBuilder',
              ),
              Tab(
                text: 'StreamBuilder',
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            FutureBuilderRoute(),
            StreamBuilderRoute(),
          ],
        ),
      ),
    );
  }
}

class FutureBuilderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FutureBuilderRouteState();
}

class _FutureBuilderRouteState extends State<FutureBuilderRoute> {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: FutureBuilder(
      builder: (context, AsyncSnapshot snapshot) {
        // 请求已结束
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // 请求失败，显示错误
            return Text("Error: ${snapshot.error}");
          } else {
            // 请求成功，显示数据
            return Text("Contents: ${snapshot.data}");
          }
        } else {
          // 请求未结束，显示loading
          return  SizedBox(
            width: 40,height: 40,
            child: CircularProgressIndicator(),
          );
        }
      },
      future: mockNetworkData(),
    ),);
  }
}

//*******************StreamBuilder**********************************///
class StreamBuilderRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StreamBuilderState();

}
class _StreamBuilderState  extends State<StreamBuilderRoute>{
  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }
  @override
  Widget build(BuildContext context) {
   return Center(child: StreamBuilder(builder: (context,snapshot){
     if (snapshot.hasError)
       return Text('Error: ${snapshot.error}');
     switch (snapshot.connectionState) {
       case ConnectionState.none:
         return Text('没有Stream');
       case ConnectionState.waiting:
         return Text('等待数据...');
       case ConnectionState.active:
         return Text('active: ${snapshot.data}');
       case ConnectionState.done:
         return Text('Stream已关闭');
     }
     return null; // unreachable
   },stream: counter(),),);
  }

}
