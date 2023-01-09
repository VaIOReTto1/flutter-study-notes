import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioDemo extends StatelessWidget {
  const DioDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('点击发送请求'),
        onPressed: () {
          getIpAddress();
        },
      ),
    );
  }

  void getIpAddress() async {
    try {
      final url = 'https://httpbin.org/ip';
      Response response = await Dio().get(url);
      String ip = response.data['origin'];
      print(ip);
    } catch (e) {
      print(e);
    }
  }
}

class FlutterSwiperDemo extends StatelessWidget {
  final List<String> imgs = [
    'images/1.png',
    'images/2.png',
    'images/3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 200,
          child: Swiper(
            itemCount: imgs.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imgs[index],
                fit: BoxFit.cover,
              );
            },
            pagination: SwiperPagination(), //轮播图片底下的指示点
            control: SwiperControl(), //左右箭头导航
          ),
        ),
        Container(
          height: 200,
          child: Swiper(
            itemCount: imgs.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imgs[index],
                fit: BoxFit.cover,
              );
            },
            viewportFraction: 0.7,
            scale: 0.7,
          ),
        ),
        Container(
          height: 200,
          child: Swiper(
            itemCount: imgs.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imgs[index],
                fit: BoxFit.cover,
              );
            },
            itemWidth: 300,
            layout: SwiperLayout.STACK,
          ),
        ),
        Container(
          height: 200,
          child: Swiper(
            itemCount: imgs.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imgs[index],
                fit: BoxFit.cover,
              );
            },
            itemWidth: 300,
            itemHeight: 200,
            layout: SwiperLayout.TINDER,
          ),
        )
      ],
    );
  }
}

class SharedPreferencesDemo extends StatelessWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ElevatedButton(onPressed: _incrementCount, child: Text('递增')),
            ElevatedButton(onPressed: _decrementCount, child: Text('递减')),
            ElevatedButton(onPressed: _removeCount, child: Text('删除')),
            ElevatedButton(onPressed: _addMyCount, child: Text('设置字符串')),
            ElevatedButton(onPressed: _getMyCount, child: Text('获取字符串')),
            ElevatedButton(onPressed: _claerCount, child: Text('删除字符串'))
          ],
        ));
  }
}

_incrementCount() async {
  //获取保存实例
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  await prefs.setInt('counter', counter);
}

_decrementCount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = prefs.getInt('counter') ?? 0;
  if(counter>0){
    counter--;
  }
  print('Pressed $counter times.');
  await prefs.setInt('counter', counter);
}

_removeCount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('counter');
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
}

_addMyCount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('hi', 'Hello World');
  String content = prefs.getString('hi') ?? "";
  print('设置的字符串内容时$content');
}

_getMyCount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String content = prefs.getString('hi') ?? "";
  print('获取字符串内容是$content');
}

_claerCount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}