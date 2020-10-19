import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextEditAndFormWidget extends StatefulWidget {
  static final String routerName = '/SwitchAndCheckBoxTestRoute';
  @override
  State<StatefulWidget> createState() => _TextEditAndFormWidgetState();
}

class _TextEditAndFormWidgetState extends State<TextEditAndFormWidget> {
  TextEditingController _userNameEditingController = TextEditingController();
  TextEditingController _passWordEditingController = TextEditingController();
  TextEditingController _selectEditingController = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNodeEmail = FocusNode();

  FocusScopeNode focusScopeNode;


  @override
  void initState() {
    super.initState();
    _userNameEditingController.addListener(() {
      debugPrint(_userNameEditingController.text);
    });
    _passWordEditingController.addListener(() {
      print(_passWordEditingController.text);
    });

    ///设置默认值，并从第三个字符开始选中后面的字符
    _selectEditingController.text = 'hello world!';
    _selectEditingController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _selectEditingController.text.length - 1,
    );
    //监听焦点状态改变事件,获得焦点时focusNode.hasFocus值为true，失去焦点时为false。
    _focusNode2.addListener(() {
      print("_focusNode2 listener : ${_focusNode2.hasFocus}");
    });
    _focusNodeEmail.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          hintColor: Colors.grey[200], //定义下划线
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0), //定义提示文本样式
          ) // 颜色
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('TextEditAndFormWidget'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  //是否自动获取焦点。
                  maxLines: 1,
                  //输入框的最大行数，默认为1；如果为null，则无行数限制。
                  //maxLength代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数。
                  // maxLengthEnforced决定当输入文本长度超过maxLength时是否阻止输入，为true时会阻止输入，
                  // 为false时不会阻止输入但输入框会变红。
                  maxLength: 10,
                  maxLengthEnforced: true,
                  controller: _userNameEditingController,
                  //用于控制TextField是否占有当前键盘的输入焦点。它是我们和键盘交互的一个句柄（handle）。
                  focusNode: _focusNode1,
                  //关联focusNode1
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      labelText: '用户名',
                      hintText: '用户名或邮箱',
                      prefixIcon: Icon(Icons.person)),
                ),
                TextField(
                  focusNode: _focusNode2, //关联focusNode2
                  //监听文本变化，除了能监听文本变化外，它还可以设置默认值、选择文本，
                  controller: _passWordEditingController,
                  decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '您的密码',
                      prefixIcon: Icon(Icons.lock)),
                  obscureText: true, //否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。
                ),
                TextField(
                  //监听文本变化，专门用于监听文本变化
                  onChanged: (value) {
                    print('onChanged : $value');
                  },
                  decoration: InputDecoration(
                      labelText: 'onChanged 监听',
                      hintText: '您的密码',
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 13.0),
                      prefixIcon: Icon(Icons.lock)),
                  obscureText: true, //否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。
                ),
                TextField(
                  controller: _selectEditingController,
                ),
                Container(
                  child: TextField(
                    //用于设置该输入框默认的键盘输入类型，
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _focusNodeEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: '电子邮件地址',
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none, //隐藏下划线
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      // 下滑线浅灰色，宽度1像素
                      color: _focusNodeEmail.hasFocus?Colors.orange[600]:Colors.grey[200],width: 1.0
                    )),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    if (null == focusScopeNode) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(_focusNode2);
                  },
                  child: Text('移动焦点'),
                ),
                RaisedButton(
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    _focusNode1.unfocus();
                    _focusNode2.unfocus();
                  },
                  child: Text('隐藏键盘'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
