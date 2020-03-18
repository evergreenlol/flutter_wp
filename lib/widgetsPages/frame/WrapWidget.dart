import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap'),
      ),
      body: Wrap(
        spacing: 10, //水平方向间距
        runSpacing: 10,//纵轴间距
        alignment: WrapAlignment.center,
        children: <Widget>[
          Chip(
            label: Text('Hank'),
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
          ),
          Chip(
            label: Text('Michael'),
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('B')),
          ),
          Chip(
            label: Text('Sam'),
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('C')),
          ),
          Chip(
            label: Text('Sunfield'),
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('D')),
          )
        ],
      ),
    );
  }
}