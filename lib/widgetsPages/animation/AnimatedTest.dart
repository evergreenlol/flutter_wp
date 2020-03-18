import 'package:flutter/material.dart';
import 'package:flutter_wp/widgetsPages/animation/HeroAnimatedPage.dart';
class ScaleAnimationRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScaleAnimationRoute();
  }
}

class _ScaleAnimationRoute extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin{

  Animation<double>animation; //如果定义了是double,那么输入的值必须是double类型
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0 , end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return  AnimatedImage(animation: animation,); //方式一

    //方式二
    return Scaffold(
        appBar: AppBar(
          title: Text("animationTest"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: GrowTransition(
                child: Image.asset("images/member_crown.png"),
                animation: animation,
              ),
            ),
            Container(
              //此处添加hero动画
              child: InkWell(
                child: Hero(
                  tag: "avatar",
                  child: ClipOval(
                    child: Image.asset("images/member_crown.png",width: 50,),
                  ),
                ),

                onTap: (){
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation){
                    return new FadeTransition(
                      opacity: animation,
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text("原图"),
                        ),
                        body: HeroAnimationRouteB(),
                      ),
                    );
                  })
                  );
                },
              ),
            )
          ],
        )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}

//重构的方式1
class AnimatedImage extends AnimatedWidget{
  AnimatedImage({Key key, Animation<double> animation})
      : super(listenable:animation);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;
    return Scaffold(
      appBar: new AppBar(
        title: Text("animation"),
      ),
      body: new Container(
        child: Image.asset("image/2.0x/member_crown.png",
            width: animation.value,
            height: animation.value
        ),
      ),
    );
  }
}


//重构的方式2
class GrowTransition extends StatelessWidget{

  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child){
            return new Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: child
      ),
    );
  }
}

