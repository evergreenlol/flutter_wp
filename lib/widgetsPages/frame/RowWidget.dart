import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.yellowAccent,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.blueAccent,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.redAccent,
        )
      ],
    );
  }
}

