import 'package:flutter/material.dart';
import 'package:flutter_wp/Utils/netUtil.dart';
import 'dart:convert'; //数据转换
import 'package:flutter_wp/Constants/Constants.dart';
import 'package:flutter_wp/FirstPages/newsDetailPage.dart';
import 'package:flutter_wp/FirstPages/secondListItem.dart';

class SecondPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => SecondState();
}

class SecondState extends State<SecondPage> {

  final ScrollController _controller = ScrollController();

  var listData;
  var curPage = 1;
  var listTotalSize = 0;
  bool _hasMore = true; // 是否还有更多数据可加载
  bool isLoading = false; // 是否正在请求数据中

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsList(false);

    _controller.addListener((){
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        curPage++;
        getNewsList(true);
      }
    });


  }

  // 从网络获取数据，isLoadMore表示是否是加载更多数据
  getNewsList(bool isLoadMore) {
    String url = 'https://fluttergo.pub:9527/juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';
    url += "&page=$curPage&pageSize=10&sort=rankIndex";

    isLoading = true;

    NetUtils.get(url).then((data) {
      print(data);
      if (data != null) {
        // 将接口返回的json字符串解析为map类型
        Map<String, dynamic> map = json.decode(data);

          // total表示资讯总条数
          listTotalSize = map['d']['total'];
          // data为数据内容，其中包含slide和news两部分，分别表示头部轮播图数据，和下面的列表数据
          var _listData = map['d']['entrylist'];
          setState(() {
            if (!isLoadMore) {
              // 不是加载更多，则直接为变量赋值
              listData = _listData;
            } else {

              // 是加载更多，则需要将取到的news数据追加到原来的数据后面
              List list1 = List();
              // 添加原来的数据
              list1.addAll(listData);
              // 添加新取到的数据
              list1.addAll(_listData);
              // 判断是否获取了所有的数据，如果是，则需要显示底部的"我也是有底线的"布局
              if (list1.length >= listTotalSize) {
                list1.add(Constant.endLineTag);
                _hasMore = false;
              }else{
                _hasMore = true;
              }
              // 给列表数据赋值
              listData = list1;
            }

//            isLoading = false;

          });
      }
    });
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    getNewsList(false);
    return null;
  }

  // 加载中的提示
  Widget _buildLoadText() {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Text("数据没有更多了！！！"),
          ),
        ));
  }

// 上提加载loading的widget,如果数据到达极限，显示没有更多
  Widget _buildProgressIndicator() {
    if (_hasMore) {
      return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
            child: Column(
              children: <Widget>[
                new Opacity(
                  opacity: isLoading ? 1.0 : 0.0,
                  child: new CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blue)),
                ),
                SizedBox(height: 20.0),
                Text(
                  '稍等片刻更精彩...',
                  style: TextStyle(fontSize: 14.0),
                )
              ],
            )
          //child:
        ),
      );
    } else {
      return _buildLoadText();
    }
  }

  @override
  void didUpdateWidget(SecondPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    // 无数据时，显示Loading
    if (listData == null) {
      return Center(
        // CircularProgressIndicator是一个圆形的Loading进度条
        child: CircularProgressIndicator(),
      );
    } else {
      // 有数据，显示ListView
      Widget listView = ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, i) {

          if (i == listData.length - 1){
            return _buildProgressIndicator();
          }else{
            var myTitle = '${listData[i]['title']}';
            var myUsername = '${'👲'}: ${listData[i]['username']} ';
            var codeUrl = '${listData[i]['detailUrl']}';
            return new ListViewItem(data: myUsername,itemTitle: myTitle,itemUrl: codeUrl);
          }

        },
        controller: _controller,
      );
      return RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }
}