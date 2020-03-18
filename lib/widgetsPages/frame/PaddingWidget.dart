import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 10, 6, 8),
      child: Text("Go To Hell"),
    );
  }
}