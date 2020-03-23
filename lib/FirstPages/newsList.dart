import 'package:flutter/material.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
import 'package:flutter_wp/Utils/netUtil.dart';
import 'package:flutter_wp/Widgets/commonEndLine.dart';
import 'dart:convert'; //数据转换
import 'package:flutter_wp/Constants/Constants.dart';
import 'package:flutter_wp/FirstPages/newsDetailPage.dart';
import 'package:flutter_wp/Widgets/NewsListItem.dart';

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

  final List<dynamic> bannerData = [
    {'image': 'https://img.alicdn.com/tfs/TB1W4hMAwHqK1RjSZJnXXbNLpXa-519-260.jpg', 'type': 0, 'id': 9695909, 'url': 'https://www.zhihu.com/question/294145797/answer/551162834', 'title': '为什么阿里巴巴、腾讯和 Google 之类的企业都在使用 Flutter 开发 App？'},
    {'image': 'https://img.alicdn.com/tfs/TB1XmFIApzqK1RjSZSgXXcpAVXa-720-338.jpg', 'type': 0, 'id': 9695859, 'url': 'https://zhuanlan.zhihu.com/p/51696594', 'title': 'Flutter 1.0 正式发布: Google 的便携 UI 工具包'},
    {'image': 'https://img.alicdn.com/tfs/TB1mClCABLoK1RjSZFuXXXn0XXa-600-362.jpg', 'type': 0, 'id': 96956491409, 'url':'https://zhuanlan.zhihu.com/p/53497167','title': 'Flutter 示范应用现已开源 — 万物起源(The History of Everything)'},
    {'image': 'https://img.alicdn.com/tfs/TB1fXxIAAvoK1RjSZFNXXcxMVXa-600-362.jpg', 'type': 0, 'id': 9695816, 'url': 'https://mp.weixin.qq.com/s?__biz=MzAwODY4OTk2Mg==&mid=2652048101&idx=1&sn=20296088e4bd8ca33c5c9991167d9f7d&chksm=808caaa0b7fb23b65c0e5806209f8d86da6732f3a00a70353f3606018339518b0a8656f14dc5&mpsshare=1&scene=2&srcid=0106SZapVysZdIS6Oc5AhNH6&from=timeline&ascene=2&devicetype=android-27&version=27000038&nettype=WIFI&abtest_cookie=BQABAAgACgALABMAFAAFAJ2GHgAjlx4AV5keAJuZHgCcmR4AAAA%3D&lang=zh_CN&pass_ticket=4K1%2FUpsxP4suPj2iubR17wbAP7r9LW9iYrPAC2dppTqv7j7JO5FWMXtcKeBRxueV&wx_header=1', 'title': 'Flutter 与 Material Design 双剑合璧，助您构建精美应用'}
  ];

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
        itemCount: listData.length + 1,
        itemBuilder: (context, i){

          if(i == 0){
            return banner;
          }else {

            var subTitle = '${'👲'}: ${listData[i - 1]['viewsCount']} ';
            var title = '${listData[i - 1]['title']}';
            var codeUrl = '${listData[i - 1]['originalUrl']}';

//            return new NewsListItem(title: title,subTitle: subTitle);
              return InkWell(
                child: new NewsListItem(title: title,subTitle: subTitle),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => NewsDetailPage(id:codeUrl)
                  ));
                },
              );
          }

        },
        controller: _controller,
      );
      return RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }

  // 从网络获取数据，isLoadMore表示是否是加载更多数据
  getNewsList(bool isLoadMore) {

    String url = 'https://fluttergo.pub:9527/juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';
    url += "&page=$curPage&pageSize=10&sort=rankIndex";

    NetUtils.get(url).then((data) {
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
              }
              // 给列表数据赋值
              listData = list1;
              // 轮播图数据
//              slideData = _slideData;
            }
            initSlider();
          });
        }
//      }
    });
  }

  initSlider(){
    banner = BannerSwiper(

      //width  和 height 是图片的高宽比  不用传具体的高宽   必传
      height: 108,
      width: 54,
      //轮播图数目 必传
      length: bannerData.length,

      //轮播的item  widget 必传
      getwidget: (index) {
        var item = bannerData[index % bannerData.length];
        var imgUrl = item['image'];
//        var title = item['title'];
        var detailUrl = item['url'];
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

}