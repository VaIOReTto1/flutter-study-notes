import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //1.创建 AnimationController
    controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    //2.声明动画曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    //3.设置动画值的范围
    animation = Tween(begin: 50.0, end: 300.0).animate(controller);

    //4.监听动画
    animation.addListener(() {
      print(animation.value);
      setState(() {});
    });

    //5.执行动画
    //controller.forward();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                controller.forward();
              },
              child: Text('放大')),
          ElevatedButton(
              onPressed: () {
                controller.reverse();
              },
              child: Text('缩小')),
          ElevatedButton(
              onPressed: () {
                animation.addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    //反向执行动画
                    controller.reverse();
                  } else if (status == AnimationStatus.dismissed) {
                    //正向
                    controller.forward();
                  }
                });
                controller.forward();
              },
              child: Text('重复')),
          ElevatedButton(
              onPressed: () {
                controller.stop();
              },
              child: Text('停止')),
          Icon(
            Icons.accessible_forward_outlined,
            color: Colors.blue,
            size: animation.value,
          ),
          Opacity(
            opacity: controller.value,
            child: Text('hello world'),
          )
        ],
      ),
    );
  }

  //切换至后台的时候会调用来释放资源
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}

class StaggerAnimationDemo extends StatefulWidget {
  const StaggerAnimationDemo({Key? key}) : super(key: key);

  @override
  State<StaggerAnimationDemo> createState() => _StaggerAnimationDemoState();
}

class _StaggerAnimationDemoState extends State<StaggerAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation sizeAnimation;
  late Animation colorAnimation;
  late Animation rotationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //1.创建 AnimationController
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    //2.创建动画
    animation = CurvedAnimation(parent: controller, curve: Interval(0.0, 0.5))
      ..addListener(() {});

    //3.让动画反复运行
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //正向
        controller.forward();
      }
    });

    //4.设置其他动画
    sizeAnimation = Tween(begin: 0.0, end: 200.0).animate(animation); //需要将animation设为<double>
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.red).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.8, curve: Curves.bounceIn)))
      ..addListener(() {
        setState(() {});
      });
    rotationAnimation = Tween(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.8, 1.0, curve: Curves.easeIn),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                controller.forward();
              },
              child: Text('重复')),
          ElevatedButton(
              onPressed: () {
                controller.stop();
              },
              child: Text('停止')),
          Icon(
            Icons.accessible_forward_outlined,
            color: Colors.blue,
            size: animation.value,
          ),
          Opacity(
              opacity: controller.value,
              child: Transform.rotate(
                angle: rotationAnimation.value,
                child: Container(
                  width: sizeAnimation.value,
                  color: colorAnimation.value,
                  height: sizeAnimation.value,
                ),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}

class HeroAnimationDemo extends StatelessWidget {
  const HeroAnimationDemo({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: GridView.extent(
          maxCrossAxisExtent: 300.0,
        mainAxisSpacing: 20,
        children: List.generate(20, (index){
          String imageURL='https://picsum.photos/id/$index/300/400';
          return GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
                return ImageDetail(imageURL);
              }));
            },
            child: Hero(
              tag: imageURL,
              child: Image.network(imageURL),
            ),
        );
        }),
      ),
    );
  }
}

class ImageDetail extends StatelessWidget {
  final String imageURl;
  ImageDetail(this.imageURl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: (){
            //调回去
            Navigator.pop(context);
          },
          child: Hero(
            tag: imageURl,
            child: Image.network(
              imageURl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
