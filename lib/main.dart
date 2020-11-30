import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_app_01/SecondPage.dart';
import 'package:flutter_app_01/Tab_Page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'Layout_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appName = '自定义主题';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // brightness: Brightness.dark,//应用整体主题的亮度。用于按钮之类的小部件，以确定在不使用主色或强调色时选择什么颜色
        brightness: Brightness.light,//应用整体主题的亮度。用于按钮之类的小部件，以确定在不使用主色或强调色时选择什么颜色
        primaryColor: Colors.lightBlue[800], //应用程序主要部分的z背景颜色(toolbars、tab bars 等)
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'second' : (BuildContext context) => SecondPage(),
        'tabPage' : (BuildContext context) => TabPage(),
        'layoutPage' : (BuildContext context) => LayoutPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    new Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'You have pushed the button this many times:',
                          ),
                          Text(
                            '$_counter',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          new RaisedButton(
                            onPressed: () async {
                              const url = 'https://wwww.baidu.com';
                              if(await canLaunch(url)){
                                await launch(url);
                              }else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: new Text('打开百度'),
                          ),
                          new RaisedButton(
                            onPressed: () async {
                              const url = 'http://www.weather.com.cn/data/cityinfo/101010100.html';

                              // 使用utf8进行解码字节
                              Utf8Codec utf=new Utf8Codec();

                              http.get(url).then((response) {
                                String body = utf.decode(response.bodyBytes);

                                print('Then Response status:${response.statusCode}');
                                print('Then Response body:${body}');
                              }).catchError((error) {
                                print('$error错误');
                              });

                              var response = await http.get(url);
                              String body = utf.decode(response.bodyBytes);
                              print('Response status:${response.statusCode}');
                              print('Response body:${body}');
                            },
                            child: new Text('Http请求'),
                          ),
                          new Center(
                            child: new Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: new Border.all(
                                      color: Colors.yellow,//边框颜色
                                      width: 8.0//边框大小
                                  ),
                                  borderRadius: const BorderRadius.all(const Radius.circular(8.0)) //边框四个角的弧度
                              ),
                              child: new Text('Flutter Container',textAlign: TextAlign.center,style: TextStyle(fontSize: 28.0,color: Colors.black),),
                            ),
                          ),
                          new Center(
                            child: new Image.network(
                              'https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png',//图片地址
                              fit: BoxFit.cover, //填充模式
                              width: 50.0,//
                              height: 50.0,
                            ),
                          ),
                          new Container(
                            child: new Column(
                              children: [
                                new Container(
                                  child: new Form(
                                    child: new Column(
                                      children: [
                                        new TextFormField(
                                          decoration: new InputDecoration(
                                            labelText: '账号'
                                          ),
                                        ),
                                        new TextFormField(
                                          decoration: new InputDecoration(
                                            labelText: '密码',
                                          ),
                                          obscureText: true,//是否模糊输入
                                        ),
                                        new RaisedButton(
                                          child: new Text('登录'),
                                          onPressed: () {

                                          }
                                        )
                                      ],
                                    )
                                  ),
                                )
                              ],
                            ),
                          ),
                          new RaisedButton(
                              child: new Text('路由跳转'),
                              onPressed: () {
                                Navigator.pushNamed(context, 'second');
                              }
                          ),
                          new RaisedButton(
                              child: new Text('Tab'),
                              onPressed: () {
                                Navigator.pushNamed(context, 'tabPage');
                              }
                          ),
                          new FlatButton(
                            onPressed: (){},
                            child: new Text('data'),
                            color: Colors.deepOrange,
                          ),
                          new FlatButton(
                            onPressed: (){},
                            child: PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                                List<PopupMenuEntry> list = List<PopupMenuEntry>();
                                list.add(PopupMenuItem(
                                  value: '1',
                                  child: Text('Item 1'),
                                ),);

                                list.add(PopupMenuItem(
                                  value: '2',
                                  child: Text('Item 2'),
                                ),);
                                list.add(PopupMenuDivider(),);
                                list.add(CheckedPopupMenuItem(
                                  value: '3',
                                  child: Text('Item 3'),
                                  checked:true,
                                ),);
                                return list;
                              },
                              icon: Icon(Icons.more_horiz),
                            ),
                            color: Colors.deepOrange,
                          ),
                          new FlatButton(
                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return new SimpleDialog(
                                    title: new Center(
                                      child: new Text('我是标题'),
                                    ),
                                    titleTextStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      Text('data'),
                                      SimpleDialogOption(onPressed: (){print('click');},child: const Text('data'),)
                                    ],
                                  );
                                },
                              );
                            },
                            child: new Text('显示SimpleDialog'),
                            color: Colors.deepOrange,
                          ),
                          new FlatButton(
                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    title: new Text('我是AlertDialog'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          Text('ddd')
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(onPressed: null, child: new Text('取消')),
                                      FlatButton(onPressed: null, child: new Text('确认')),
                                    ],
                                  );
                                }
                              );
                            },
                            child: new Text('显示AlertDialog'),
                          ),
                          new FlatButton(
                            onPressed: (){
                              _scaffoldkey.currentState.showSnackBar(new SnackBar(
                                content: Row(
                                  children: <Widget>[
                                    Icon(Icons.check,color: Colors.green,),
                                    Text('下载成功')],
                                ),
                                behavior: SnackBarBehavior.floating,
                              ));
                            },
                            child: new Text('showSnackBar'),
                          ),
                          new Card(
                            child: new Container(
                              padding: EdgeInsets.all(10.0),
                              child: new Column(
                                children: <Widget>[
                                  new ListTile(
                                    title: new Text('data'),
                                    subtitle: new Text('sub title'),
                                    leading: new Icon(Icons.phone),
                                  ),
                                  new Divider(),
                                  new ListTile(
                                    title: new Text('data'),
                                    subtitle: new Text('sub title'),
                                    leading: new Icon(Icons.phone),
                                  ),
                                ],
                              ),
                            ),
                            elevation: 3.0,
                          ),
                          new FlatButton(
                            onPressed: (){
                              Navigator.pushNamed(context, 'layoutPage');
                            },
                            child: new Text('页面布局'),
                          ),
                        ],
                      ),
                    ),
                  ]
                )
            ),
          )
        ],
      ),
      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.red),
        child: new FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.computer),
        ),
      ),
    );
  }
}
