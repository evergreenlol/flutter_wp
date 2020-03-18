import 'package:flutter/material.dart';

class FrameTestItem extends StatelessWidget{
  final String title;
  final String subTitle;

  const FrameTestItem({Key key, this.title, this.subTitle}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
          child:Container(
            color: Colors.greenAccent,
            child: FlatButton(
                onPressed: (){},
                child: Text("test",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
            ),
            width: 100,
            height: 60,
          )
        ),
        Column(
          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
//              child: Text(title),
//            ),
//            Padding(
//              padding: EdgeInsets.fromLTRB(5, 20, 10, 0),
//              child: Text(subTitle),
//            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(title),
                ),
              ),
              height: 30,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(subTitle),
                ),
              ),
              height: 30,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ],
    );
  }
}