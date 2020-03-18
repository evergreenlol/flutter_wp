import 'package:flutter/material.dart';

class ExpandWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: (){

          },
          color: Colors.green,
          child: new Text('绿色按钮1'),
        ),
        new Expanded(
          child: new RaisedButton(
            onPressed: (){

            },
            color: Colors.yellow,
            child: new Text('黄色按钮2'),
          ),
        ),
        new RaisedButton(
          onPressed: (){

          },
          color: Colors.black,
          child: new Text('黑色按钮1'),
        ),
        new RaisedButton(
          onPressed: (){

          },
          color: Colors.orange,
          child: new Text('橘黄色按钮'),
        ),
      ],
    );
  }
}