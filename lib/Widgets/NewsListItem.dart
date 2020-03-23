import 'package:flutter/material.dart';

class NewsListItem extends StatelessWidget{

  final String title;
  final String subTitle;

  const NewsListItem({Key key, this.title, this.subTitle}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          //主要用来设置阴影设置
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 4,
              color: Color.fromARGB(20, 0, 0, 0),
            ),
          ],
        ),

      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10,top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(title),
                  ),
                ),
                width: MediaQuery.of(context).size.width - 120,
                height: 60,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(subTitle),
                  ),
                ),
                width: MediaQuery.of(context).size.width - 120,
                height: 20,
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFECECEC),
              image: DecorationImage(
                  image: ExactAssetImage('./images/ic_news_placeholder.png'), fit: BoxFit.cover),
              border: Border.all(
                color: const Color(0xFFECECEC),
                width: 2.0,
              ),
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      )
    );
  }
}