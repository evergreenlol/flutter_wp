import 'package:flutter/material.dart';
//import 'dart:math' as math;
//main(){
//  runApp(new MyApp());
//}

class StackWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Test",
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("test"),
          ),

//        body: new ConstrainedBox(
//          constraints: const BoxConstraints.expand(width: 100.0,height: 100.0),
//          child: new Container(
//            color: Colors.red,
////            child: new Text("what the fuck ???"),
//            width: 200.0,
//            height: 100.0,
//            child: new Transform(
//              alignment: Alignment.topRight,
//              transform: new Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
//              child: new Container(
//                padding: const EdgeInsets.all(8.0),
//                color: Colors.amber,
//                child: const Text('What the Hell a u doin'),
//              ),
//            )
//          ),
//        )
          //IndexedStack用于根据索引来显示子组件，index为0则显示第一个子组件，index为1则显示第二个子组件，以此类推
          body: new IndexedStack(
            index: 2,
            children: <Widget>[
              new Container(
                width: 100.0,
                height: 100.0,
                color: Colors.red,
                child: new Center(
                  child: new Text("index: 0", style: new TextStyle(fontSize: 20.0),),
                ),
              ),
              new Container(
                width: 100.0,
                height: 100.0,
                color: Colors.green,
                child: new Center(
                  child: new Text("index: 1", style: new TextStyle(fontSize: 20.0),),
                ),
              ),
              new Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                child: new Center(
                  child: new Text("index: 2",style: new TextStyle(fontSize: 20.0),),
                ),
              )
            ],
          )
      ),
    );
  }
}

