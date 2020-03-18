import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_wp/widgetsPages/ListViewPage.dart';
import 'package:flutter_wp/widgetsPages/ScrollViewPage.dart';
import 'package:flutter_wp/widgetsPages/grid/GridViewPage.dart';
import 'package:flutter_wp/widgetsPages/animation/AnimatedPages.dart';
import 'package:flutter_wp/widgetsPages/Progress/gradientCirle.dart';
import 'package:flutter_wp/widgetsPages/frame/FrameLayout.dart';
import 'package:flutter_wp/widgetsPages/PickerPage.dart';
import 'package:flutter_wp/widgetsPages/CardPage.dart';
import 'package:flutter_wp/widgetsPages/MenuPage.dart';
import 'package:flutter_wp/widgetsPages/DialogPage.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(4, 1),
];

List<String> titles = ['ListView','ScrollView','Card','Menu','GridView','Dialog','Frame','Picker','Progress','Animation'];
List<Map> _properties = [
  {'color':Colors.green,'icon':Icons.view_list},
  {'color':Colors.lightBlue,'icon':Icons.swap_vertical_circle},
  {'color':Colors.amber,'icon':Icons.credit_card},
  {'color':Colors.brown,'icon':Icons.menu},
  {'color':Colors.deepOrange,'icon':Icons.grid_on},
  {'color':Colors.indigo,'icon':Icons.add_alert},
  {'color':Colors.red,'icon':Icons.aspect_ratio},
  {'color':Colors.pink,'icon':Icons.event_note},
  {'color':Colors.purple,'icon':Icons.sync},
  {'color':Colors.blue,'icon':Icons.format_line_spacing},
];

class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Widgets',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
        ),
        body: new Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: new StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) =>new _WigetTile(_properties[index]['color'], _properties[index]['icon'], index,titles[index]),
            staggeredTileBuilder: (int index) => _staggeredTiles[index],
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            padding: const EdgeInsets.all(4.0),
          ),
        )
    );
  }
}

class _WigetTile extends StatelessWidget {
  const _WigetTile(this.backgroundColor, this.iconData,this.index,this.title);

  final Color backgroundColor;
  final IconData iconData;
  final int index;
  final String title;


  @override
  Widget build(BuildContext context) {
    print(index);

    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {
          print(index);
          if (index == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context){
                return ListViewPage();
              }));
          }else if(index == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ScrollViewPage();
            }));
          }else if(index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return CardLessDefault();
            }));
          }else if(index == 3){
            Navigator.push(context, MaterialPageRoute(builder: (context){
//              return PopupMenuDividerDemo();
              return Scaffold(
                appBar: AppBar(
                  title: new Text('Menu',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                body: PopupMenuDividerDemo(),
              );
            }));
          } else if(index == 4){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return GridViewPage();
            }));
          }else if(index == 5){
            Navigator.push(context, MaterialPageRoute(builder: (context){
//              return ScrollViewPage();
              return Scaffold(
                appBar: AppBar(
                  title: new Text('Dialog',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                body: DialogDemo(),
              );
            }));
          }else if(index == 6){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return FlutterUI();
            }));
          }else if(index == 7){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return MothPickerDemo();
            }));
          }else if(index == 8){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return GradientCircularProgressRoute();
            }));
          } else if(index == 9){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AnimatedPage();
            }));
          }
        },
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Icon(iconData,color: Colors.white,),
                SizedBox(
                  height: 8.0,
                ),
                Text(title, style: TextStyle(color: Colors.white,fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
