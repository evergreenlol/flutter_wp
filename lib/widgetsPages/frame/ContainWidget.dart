import 'package:flutter/material.dart';

class ContainWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Text("My name is Nike"),
//      color: Colors.indigo,
        width: 200,
        height: 200,
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),//外边距
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(6),
        ),
      );
//    );


  }
}