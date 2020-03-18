import 'package:flutter/material.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
import 'package:flutter_wp/Networking/api.dart';
import 'package:flutter_wp/Utils/netUtil.dart';
import 'package:flutter_wp/Widgets/commonEndLine.dart';
import 'dart:convert'; //数据转换
import 'package:flutter_wp/Constants/Constants.dart';
import 'package:flutter_wp/FirstPages/newsDetailPage.dart';

class NewsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsState();
  }
}

class NewsState extends State<NewsPage> {

  final ScrollController _controller = ScrollController();
  final TextStyle titleTextStyle = TextStyle(fontSize: 15.0);
  final TextStyle subtitleStyle = TextStyle(color: const Color(0xFFB5BDC0), fontSize: 12.0);

  var listData;
  var slideData;
  var curPage = 1;
  var listTotalSize = 0;
  BannerSwiper banner;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener((){
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        // scroll to bottom, get next page data
//        print("load more ... ");
        curPage++;
        getNewsList(true);
      }
    });
    getNewsList(false);
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    getNewsList(false);
    return null;
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
        itemCount: listData.length * 2,
        itemBuilder: (context, i) => renderRow(i),
        controller: _controller,
      );
      return RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }

  // 从网络获取数据，isLoadMore表示是否是加载更多数据
  getNewsList(bool isLoadMore) {
    String url = Api.newsList;
    url += "?pageIndex=$curPage&pageSize=10";
    NetUtils.get(url).then((data) {
      if (data != null) {
        // 将接口返回的json字符串解析为map类型
        Map<String, dynamic> map = json.decode(data);
        if (map['code'] == 0) {
          // code=0表示请求成功
          var msg = map['msg'];
          // total表示资讯总条数
          listTotalSize = msg['news']['total'];
          // data为数据内容，其中包含slide和news两部分，分别表示头部轮播图数据，和下面的列表数据
          var _listData = msg['news']['data'];
          var _slideData = msg['slide'];
          setState(() {
            if (!isLoadMore) {
              // 不是加载更多，则直接为变量赋值
              listData = _listData;
              slideData = _slideData;
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
              }
              // 给列表数据赋值
              listData = list1;
              // 轮播图数据
              slideData = _slideData;
            }
            initSlider();
          });
        }
      }
    });
  }

  initSlider(){
    banner = BannerSwiper(

      //width  和 height 是图片的高宽比  不用传具体的高宽   必传
      height: 108,
      width: 54,
      //轮播图数目 必传
      length: slideData.length,

      //轮播的item  widget 必传
      getwidget: (index) {
        var item = slideData[index % slideData.length];
        var imgUrl = item['imgUrl'];
//        var title = item['title'];
        var detailUrl = item['detailUrl'];
        return new GestureDetector(
            child:  Image.network(imgUrl,fit: BoxFit.cover,),
            onTap: () {
              //点击后todo
              // 点击跳转到详情
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => NewsDetailPage(id: detailUrl)));
            });
      },
    );
  }

  Widget renderRow(i) {
    if (i == 0) {
      return Container(
          height: 180.0,
          child: Stack(
            children: <Widget>[
              banner
            ],
          )
      );
    }
    i -= 1;
    if (i.isOdd) {
      return Divider(height: 1.0);
    }
    i = i ~/ 2;
    var itemData = listData[i];
    if (itemData is String && itemData == Constant.endLineTag) {
      return CommonEndLine();
    }
    var titleRow = Row(
      children: <Widget>[
        Expanded(
          child: Text(itemData['title'], style: titleTextStyle),
        )
      ],
    );
    var timeRow = Row(
      children: <Widget>[
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFECECEC),
            image: DecorationImage(
                image: NetworkImage(itemData['authorImg']), fit: BoxFit.cover),
            border: Border.all(
              color: const Color(0xFFECECEC),
              width: 2.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Text(
            itemData['timeStr'],
            style: subtitleStyle,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("${itemData['commCount']}", style: subtitleStyle),
//              Image.asset('./images/ic_comment.png', width: 16.0, height: 16.0),
            ],
          ),
        )
      ],
    );
    var thumbImgUrl = itemData['thumb'];
    var thumbImg = Container(
      margin: const EdgeInsets.all(10.0),
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFECECEC),
        image: DecorationImage(
            image: ExactAssetImage('./images/ic_news_placeholder.png'),
            fit: BoxFit.cover),
        border: Border.all(
          color: const Color(0xFFECECEC),
          width: 2.0,
        ),
      ),
    );
    if (thumbImgUrl != null && thumbImgUrl.length > 0) {
      thumbImg = Container(
        margin: const EdgeInsets.all(10.0),
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFECECEC),
          image: DecorationImage(
              image: NetworkImage(thumbImgUrl), fit: BoxFit.cover),
          border: Border.all(
            color: const Color(0xFFECECEC),
            width: 2.0,
          ),
        ),
      );
    }
    var row = Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                titleRow,
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: timeRow,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            width: 100.0,
            height: 80.0,
            color: const Color(0xFFECECEC),
            child: Center(
              child: thumbImg,
            ),
          ),
        )
      ],
    );
    return InkWell(
      child: row,
      onTap: () {
        print(itemData['detailUrl']);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => NewsDetailPage(id: itemData['detailUrl'])
        ));
      },
    );
  }
}