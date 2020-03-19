import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wp/home.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';

void main() => runApp(WPClientApp());

class WPClientApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ClientState();
  }
}

class ClientState extends State<WPClientApp> {

//  final appBarTitles = ['资讯', '组件', '我的'];
//  final tabSeletedColor = TextStyle(color: const Color(0xff63ca6c));
//  final tabNormalColor = TextStyle(color: const Color(0xff969696));

  @override
  void initState() {
    super.initState();

    ShareSDKRegister register = ShareSDKRegister();
    register.setupWechat(
        "wx617c77c82218ea2c", "c7253e5289986cf4c4c74d1ccc185fb1", "https://www.sandslee.com/");
    register.setupSinaWeibo("568898243", "38a4f8204cc784f81f9f0daaf31e02e3",
        "http://www.sharesdk.cn");
    register.setupQQ("100371282", "aed9b0303e3ed1e27bae87c33761161d");

    SharesdkPlugin.regist(register);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "wp",
      theme: new ThemeData(
        primaryColor: Color(0xFFEFEFEF),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
//          color: Color(this.themeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(body:HomePage()),
    );
  }
}