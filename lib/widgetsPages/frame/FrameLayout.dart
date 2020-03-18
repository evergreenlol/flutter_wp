import 'package:flutter/material.dart';
import 'package:flutter_wp/widgetsPages/frame/ColumnWidget.dart';
import 'package:flutter_wp/widgetsPages/frame/ContainWidget.dart';
import 'package:flutter_wp/widgetsPages/frame/ExpandWidget.dart';
import 'package:flutter_wp/widgetsPages/frame/PaddingWidget.dart';
import 'package:flutter_wp/widgetsPages/frame/RowWidget.dart';
import 'package:flutter_wp/widgetsPages/frame/StackView.dart';
import 'package:flutter_wp/widgetsPages/frame/WrapWidget.dart';
class FlutterUI extends StatelessWidget{

  List<String> loadData() {
    List<String> result = [
      "ColumnWidget",
      "ContainWidget",
      "ExpandWidget",
      "PaddingWidget",
      "RowWidget",
      "StackView",
      "WrapView"
    ];

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
            title: new Text('布局',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold))
      ),
//      body: new ContainWidget(),
//      body: new PaddingWidget(),
//      body: new StackWidget(),
//        body: new ColumnWidget(),
//        body: new RowWidget(),
//        body: new ExpandWidget(),
        body: new Column(children: <Widget>[
          Expanded(
              child: new ListView.separated(
                itemCount: loadData().length,
                itemBuilder: (context, index) {
                  return new ListTile(
                      title: new Text(loadData()[index]),
                      onTap: () {
                        if(index == 0){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) {
                                return Scaffold(
                                  appBar: AppBar(
                                    title: new Text('Column',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                                  ),
                                  body: ColumnWidget(),
                                );
                              }));
                        }else if (index == 1){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) {
                                return Scaffold(
                                  appBar: AppBar(
                                    title: new Text('Contain',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                                  ),
                                  body: ContainWidget(),
                                );
                              }));
                        }else if (index == 2){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) {
                                return Scaffold(
                                  appBar: AppBar(
                                    title: new Text('Expand',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                                  ),
                                  body: ExpandWidget(),
                                );
                              }));
                        }else if (index == 3){


                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) {
                                return Scaffold(
                                  appBar: AppBar(
                                    title: new Text('Padding',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                                  ),
                                  body: PaddingWidget(),
                                );
                              }));
                        }else if (index == 4){


                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) {
                                return Scaffold(
                                  appBar: AppBar(
                                    title: new Text('Row',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                                  ),
                                  body: RowWidget(),
                                );
                              }));
                        }else if (index == 5){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) {
                                return Scaffold(
                                  appBar: AppBar(
                                    title: new Text('Stack',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                                  ),
                                  body: StackWidget(),
                                );
                              }));
                        }else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx){
                                return WrapPage();
                              }));
                        }

                      }
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  height: 0.5,
                  indent: 15,
                  endIndent: 15,
                  color: Colors.blueAccent,
                ),
              )
          )
        ],
        )
    );
  }
}

//
//class ContainWidget extends StatelessWidget{
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Text("My name is Nike"),
////      color: Colors.indigo,
//      width: 200,
//      height: 200,
//      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),//外边距
//      padding: EdgeInsets.all(30),
//      decoration: BoxDecoration(
//        color: Colors.redAccent,
//        borderRadius: BorderRadius.circular(6),
//      ),
//    );
//  }
//}
//
//class PaddingWidget extends StatelessWidget{
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.fromLTRB(4, 10, 6, 8),
//      child: Text("Go To Hell"),
//    );
//  }
//}
//
//class StackWidget extends StatelessWidget{
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      //Aliginment的范围是[-1,1],中心是[0,0].注释有写
//      //和Android一样，左移的取值是往1取，右移是往-1取
//      //这里注意，它是取stack里范围最大的布局为基准，下面是以Container为//基准对齐
//
//      alignment: new Alignment(-0.5, -0.5),
//      children: <Widget>[
//        new Image.network('https://ws1.sinaimg.cn/large/0065oQSqgy1fze94uew3jj30qo10cdka.jpg',
//          width: 300.0,
//          height: 300.0,
//        ),
//        new Opacity(
//          opacity: 0.5,
//          child: Container(
//            width: 100.0,
//            height: 100.0,
//            color: Colors.redAccent,
//          ),
//        ),
//        new Opacity(
//          opacity: 0.5,
//          child: Container(
//            width: 200.0,
//            height: 200.0,
//            color: Colors.indigo,
//          ),
//        ),
//      ],
//    );
//  }
//}
//
//class ColumnWidget extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      //设置垂直方向的对齐方式
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Container(
//          color: Colors.blue,
//          width: 50,
//          height: 50,
//        ),
//        Container(
//          color: Colors.red,
//          width: 50,
//          height: 50,
//        ),
//        Container(
//          color: Colors.yellowAccent,
//          width: 50,
//          height: 50,
//        ),
//      ],
//    );
//  }
//}
//
//class RowWidget extends StatelessWidget{
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        Container(
//          width: 100,
//          height: 100,
//          color: Colors.yellowAccent,
//        ),
//        Container(
//          width: 100,
//          height: 100,
//          color: Colors.blueAccent,
//        ),
//        Container(
//          width: 100,
//          height: 100,
//          color: Colors.redAccent,
//        )
//      ],
//    );
//  }
//}
//
//class ExpandWidget extends StatelessWidget{
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Row(
//      children: <Widget>[
//        new RaisedButton(
//          onPressed: (){
//
//          },
//          color: Colors.green,
//          child: new Text('绿色按钮1'),
//        ),
//        new Expanded(
//          child: new RaisedButton(
//            onPressed: (){
//
//            },
//            color: Colors.yellow,
//            child: new Text('黄色按钮2'),
//          ),
//        ),
//        new RaisedButton(
//          onPressed: (){
//
//          },
//          color: Colors.black,
//          child: new Text('黑色按钮1'),
//        ),
//        new RaisedButton(
//          onPressed: (){
//
//          },
//          color: Colors.orange,
//          child: new Text('橘黄色按钮'),
//        ),
//      ],
//    );
//  }
//}
