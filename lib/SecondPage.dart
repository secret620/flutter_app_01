
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage>{
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('我是second'),
        leading: new IconButton(
          icon: new Icon(Icons.backspace),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.search), onPressed: (){}),
          IconButton(icon: new Icon(Icons.add), onPressed: (){}),
        ],
      ),
      body: new Container(child: new Text('data'),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'button',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: currentIndex,
        type : BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(label: '选项1', icon: new Icon(Icons.add)),
          new BottomNavigationBarItem(label: '选项2', icon: new Icon(Icons.add)),
          new BottomNavigationBarItem(label: '选项3', icon: new Icon(Icons.add)),
        ],
        onTap: (current){
          setState(() {
            this.currentIndex = current;
          });
          print(current);
        },
        selectedItemColor: Colors.deepOrange,
      ),
    );
  }
}