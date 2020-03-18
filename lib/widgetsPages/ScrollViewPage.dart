import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/cupertino.dart';
class ScrollViewPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScrollState();
  }
}

class ScrollState extends State<ScrollViewPage>{
  ScrollController _controller = new ScrollController();
  bool showToTopStatus = false;

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _controller.addListener((){
//      print(_controller.offset);
      if(_controller.offset < 1000 && showToTopStatus){
        setState(() {
          showToTopStatus = false;
        });
      }else if (_controller.offset > 1000 && !showToTopStatus){
        setState(() {
          showToTopStatus = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: new AppBar(
        title: Text("滚动控制"),
      ),
      body:Scrollbar(
        child: SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            footer:CustomFooter(
              builder: (BuildContext context, LoadStatus mode){
                Widget body;
                if(mode==LoadStatus.idle){
                  body =  Text("pull up load");
                } else if(mode==LoadStatus.loading){
                  body =  CupertinoActivityIndicator();
                } else if(mode == LoadStatus.failed){
                  body = Text("Load Failed!Click retry!");
                } else if(mode == LoadStatus.canLoading){
                  body = Text("release to load more");
                } else{
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child:body),
                );
              },
            ),
            child: ListView.separated(
              itemCount: 100,
              controller: _controller,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text("$index"),
                );
              },
              separatorBuilder: (BuildContext context , int index) => const Divider(endIndent: 15,
                indent: 15,
                 height: 0.5,
              ),
            ),
        ),

      ),

      floatingActionButton: !showToTopStatus ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _controller.animateTo(.0, duration: Duration(milliseconds: 200 ), curve: Curves.ease);
        },
      ),
    );
  }
}