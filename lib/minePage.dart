import 'package:flutter/material.dart';
import 'package:flutter_wp/ChangeThemePage.dart';
class MinePage extends StatelessWidget {

  final TextStyle textStyle = TextStyle(fontSize: 16);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(''),
          accountEmail: Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "flutter",
              style: TextStyle(fontSize: 28),
            ),
          ),
          decoration: BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(
                  'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658'),
            ),
          ),
        ),
        // new Divider(),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 27.0,
          ),
          title: Text(
            '主题',
            style: textStyle,
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ChangeThemePage();
            }));
          },
        ),
        new Divider(),
        ListTile(
          leading: Icon(
            Icons.favorite,
            size: 27.0,
          ),
          title: Text(
            '收藏',
            style: textStyle,
          ),
          onTap: () {

          },
        ),
        new Divider(),ListTile(
          leading: Icon(
            Icons.feedback,
            size: 27.0,
          ),
          title: Text(
            '建议',
            style: textStyle,
          ),
          onTap: () {

          },
        ),
        new Divider(),

      ],
    );
  }
}