import 'package:flutter/material.dart';
import 'package:flutter_wp/FirstPages/newsList.dart';
import 'package:flutter_wp/FirstPages/secondList.dart';
import 'package:flutter_wp/Utils/ThemeUtils.dart';
import 'package:flutter_wp/Widgets/MyDrawer.dart';

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ScaffoldRoute();
  }
}

class ScaffoldRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabbarState();
  }
}

class TabbarState extends State<ScaffoldRoute> with SingleTickerProviderStateMixin{

  TabController _tabController;
  var tabs = <Tab>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = <Tab>[
      Tab(text: "开源"),
      Tab(text: "掘金")
//      Tab(
//        text: "Tab9",
//        icon: Icon(Icons.phone),
//      ),
    ];

    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener((){// ??? 未响应监听事件
      setState(() {
        switch(_tabController.index){
          case 0:
            print("第一页");
            break;
          case 1:
            print("第二页");
            break;
        }
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar (
        title: TabBar(
          controller: _tabController,
          tabs:tabs,
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.tab,
//          indicatorPadding: EdgeInsets.only(bottom: 10),
          labelColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 18.0,
          ),
          unselectedLabelColor: ThemeUtils.textDefaultColor,
          unselectedLabelStyle: TextStyle(
            fontSize: 15.0,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: TabBarView(
          controller: _tabController,
          children:<Widget>[
            NewsPage(),
            SecondPage()
          ]
      ),
      drawer: MyDrawer(),
    );

  }
}