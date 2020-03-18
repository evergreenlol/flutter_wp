import 'package:flutter/material.dart';
import 'package:flutter_wp/widgetsPages/frame/FrameTestPage.dart';

class ListViewPage extends StatelessWidget{

  List<Widget> getData(){

    List<Widget> result = new List();
    for (int i = 0; i < loadData().length; i++){
      var text = new Text("List Item $i");
      result.add(FrameTestItem(title: "List item $i",subTitle: loadData()[i],));
    }
    return result;
  }

  List<String> loadData(){

    List<String> result = ["images","textfield","text","flutter_UI","gridView","button","customSilverView","scrollView监听","动画","交织动画","自定义turnbox","自定义渐变圆","数据请求"];

    return result;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
          appBar: new AppBar(
              title: new Text(" ListView"),
              iconTheme: IconThemeData(color: Colors.white)

          ),
          body: new Column(children: <Widget>[
            ListTile(title:Text('测试')),
            Expanded(
                child: new ListView.separated(
                  itemCount: loadData().length,
                  itemBuilder: (context, index){
//                    return new ListTile(
//                      title: Padding(
//                        child:Text(
//                          loadData()[index],
//                          style: TextStyle(
//                            color: Colors.black,
//                            fontWeight:FontWeight.bold,
//                            fontSize: 16,
//                          ),
//                        ),
//                        padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
//                      ),
//                      subtitle:Row(
//                        children: <Widget>[
//                          Padding(
//                            child: Text(
//                              "💊🐦",
//                              style: TextStyle(
//                                color: Colors.grey,
//                                  fontSize: 14,
//                                fontWeight: FontWeight.normal
//                              ),
//                            ),
//                            padding: EdgeInsets.only(top: 5),
//                          )
//                        ],
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                      ) ,
//                      onTap: (){}
//                    );
                    return getData()[index];
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(
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