import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      //设置垂直方向的对齐方式
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.blue,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.yellowAccent,
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}