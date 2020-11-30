
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _TabPageState();
  }
}

class _TabPageState extends State<TabPage>  with SingleTickerProviderStateMixin {
  TabController _tabController ;

  final List<Tab> _tabs = [
    new Tab(text: '选项卡1', icon: new Icon(Icons.add),),
    new Tab(text: '选项卡2', icon: new Icon(Icons.add_shopping_cart),),
    new Tab(text: '选项卡3', icon: new Icon(Icons.phone),),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        vsync: this,//固定写法
        length: _tabs.length  //指定tab长度
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
          length: _tabs.length,
          child: new Scaffold(
            appBar: new AppBar(
              title: new Text('data'),
              bottom: new TabBar(tabs: _tabs),
            ),
            body: new TabBarView(
              children: _tabs.map((e) => e).toList(),
            ),
            drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: new Text('data'),
                    accountEmail: new Text('secret620@163.com'),
                    currentAccountPicture: new CircleAvatar(
                      backgroundImage: new NetworkImage('https://www.baidu.com/img/flexible/logo/pc/result.png')
                    ),
                  ),
                  DrawerHeader(
                      child: new CircleAvatar(
                          backgroundImage: new NetworkImage('https://www.baidu.com/img/flexible/logo/pc/result.png')
                      ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }

}