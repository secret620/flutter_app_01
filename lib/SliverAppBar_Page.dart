
import 'package:flutter/material.dart';

class SliverAppBarPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('我是second'),
      ),
      body: new Container(
        child: new Text('我是second'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'button',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomAppBar(
        child: new Container(
          height: 50.0,
        ),
      ),
    );
  }

}