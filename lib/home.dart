import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wp/Utils/ThemeUtils.dart';
import 'package:flutter_wp/Utils/DataUtils.dart';
import 'package:flutter_wp/Events/ChangeThemeEvent.dart';
import 'package:flutter_wp/Constants/Constants.dart';
import 'package:flutter_wp/minePage.dart';
import 'package:flutter_wp/widgetsPages/widgetPage.dart';
import 'package:flutter_wp/FirstPages/firstPage.dart';

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => HomeState();

}

class HomeState extends State<HomePage> {

  final appBarTitles = ['资讯', '组件', '我的'];
  final tabTextStyleSelected = TextStyle(color:ThemeUtils.currentColorTheme);
  final tabTextStyleNormal = TextStyle(color: ThemeUtils.textDefaultColor);


  Color themeColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;

  var tabImages;
  var _body;
  var pages;

  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  void initState() {
    super.initState();
    DataUtils.getColorThemeIndex().then((index) {
      print('color theme index = $index');
      if (index != null) {
        ThemeUtils.currentColorTheme = ThemeUtils.supportColors[index];
//        Constant.eventBus.fire(ChangeThemeEvent(ThemeUtils.supportColors[index]));
      }
    });
//
//    Constant.eventBus.on<ChangeThemeEvent>().listen((event) {
//      setState(() {
//        print('selected theme color = ' + event.color.toString());
//        themeColor = event.color;
//      });
//    });
//
    Constant.eventBus.on('change', (c){

      setState(() {
        print('selected theme color = ');
        themeColor = c;
      });
    });
    
    
    pages = <Widget>[FirstPage(), WidgetPage(), MinePage()];
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return MaterialApp(
      theme: ThemeData(
          primaryColor: themeColor,
//          iconTheme: IconThemeData(color: Colors.white)
      ),
      home: Scaffold(
          body: _body,
          bottomNavigationBar: CupertinoTabBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: getTabIcon(0),
                  title: getTabTitle(0)),
              BottomNavigationBarItem(
                  icon: getTabIcon(1),
                  title: getTabTitle(1)),
              BottomNavigationBarItem(
                  icon: getTabIcon(2),
                  title: getTabTitle(2)),
            ],
            currentIndex: _tabIndex,
            onTap: (index) {
              setState((){
                _tabIndex = index;
              });
            },
          ),
      ),
    );
  }
}