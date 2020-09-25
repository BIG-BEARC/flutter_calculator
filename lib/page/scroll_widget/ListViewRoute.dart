import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewRouteState();
}

class _ListViewRouteState extends State<ListViewRoute> {
  static const lodingTag = "##loading##"; //表尾标记
  var _word = <String>[lodingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
 /*   Divider divider1 = Divider(
      color: Colors.blue,
    );
    Divider divider2 = Divider(
      color: Colors.red,
    );*/
    return Material(
      /* child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('$index'),
          );
        },
        itemCount: 100,
        itemExtent: 50,
      ),*/
      //可以在生成的列表项之间添加一个分割组件，它比ListView.builder多了一个separatorBuilder参数，该参数是一个分割组件生成器。
/*      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
            );
          },
          separatorBuilder: (context, index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
          itemCount: 100),*/
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 20),
              child: DecoratedBox(

                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.red))),
                child: ListTile(
                  title: Text('商品列表'),
                ),
              ) ,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  if (_word[index] == lodingTag) {
                    if (_word.length - 1 < 100) {
                      _retrieveData();
                      return Container(
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: Text(
                          '没有更多了',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }
                  }

                  return ListTile(
                    title: Text(_word[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: Colors.blue,
                  );
                },
                itemCount: _word.length),
          ),
        ],
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _word.insertAll(_word.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
