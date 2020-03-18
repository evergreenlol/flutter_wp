import 'package:flutter/material.dart';
import 'package:flutter_wp/widgetsPages/animation/StaggerAnimationPage.dart';
import 'package:flutter_wp/widgetsPages/animation/AnimatedTest.dart';
class AnimatedPage extends StatelessWidget {


  List<String> loadData() {
    List<String> result = [
      "HeroAnimation",
      "StaggerAnimation",
    ];

    return result;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
          appBar: new AppBar(
              title: new Text(" Animation")
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
                                builder: (ctx) => ScaleAnimationRoute()
                            ));
                          }else{
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => StaggerRoute()
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