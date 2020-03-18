import 'package:flutter/material.dart';
import 'package:flutter_wp/widgetsPages/grid/NormalGridView.dart';
import 'package:flutter_wp/widgetsPages/grid/CustomSilverView.dart';
class GridViewPage extends StatelessWidget {


  List<String> loadData() {
    List<String> result = [
      "NormalGridView",
      "CustomSilverView",
    ];

    return result;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
          appBar: new AppBar(
              title: new Text(" GridView")
          ),
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
                                builder: (ctx) => NormalGridPage()
                            ));
                          }else{
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => CustomSilverView()
                            ));
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