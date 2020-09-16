import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_DialogWidgetState();

}

class _DialogWidgetState extends State<DialogWidget>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('对话框'),
     ),
     body: Container(
       child: Column(
         children: [
           RaisedButton(onPressed: ()async{
             //弹出对话框并等待其关闭
             bool delete = await showDeleteConfirmDialog1();
            if (delete == null) {
              print("取消删除");
            } else {
              print("已确认删除");
              //... 删除文件
            }
           },child: Text('普通对话框'),),
           RaisedButton(onPressed: changeLanguage,child: Text('SimpleDialog'),),
         ],
       ),
     ),
   );
  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
  return  showDialog(context: context,builder: (context){
      return AlertDialog(title: Text('提示'),
      content: Text('您确定要删除当前文件吗?'),
      actions: [
        FlatButton(onPressed: (){
          // 关闭对话框
          Navigator.of(context).pop();
        }, child: Text('取消')),
        FlatButton(onPressed: (){
          //关闭对话框并返回true
          Navigator.of(context).pop(true);
        }, child: Text('删除')),
      ],);
    });
  }
  Future<void> changeLanguage() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }
}