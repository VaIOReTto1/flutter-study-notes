import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosAndAndroidDemo extends StatelessWidget {
  const IosAndAndroidDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget dialogBox;
    //判断当前平台信息
    if(Platform.isAndroid){
     dialogBox=MaterialDemo();
    }
    else if(Platform.isIOS){
      dialogBox=CupertinoDemo();
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Materfial - 安卓风格'),
          MaterialDemo(),

          Text('Cupertino - IOS风格'),
          CupertinoDemo(),
        ],
      ),
    );
  }
}

class MaterialDemo extends StatelessWidget {
  const MaterialDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text('提示'),
        content: Text('确认删除吗'),
        actions: [
          TextButton(
              onPressed: () {
                print('取消的逻辑');
              },
              child: Text('取消')),
          TextButton(
              onPressed: () {
                print('确认的逻辑');
              },
              child: Text('确认')),
        ],
      ),
    );
  }
}

class CupertinoDemo extends StatelessWidget {
  const CupertinoDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoAlertDialog(
        title: Text('提示'),
        content: Text('确认删除吗'),
        actions: [
          CupertinoDialogAction(
              onPressed: () {
                print('取消的逻辑');
              },
              child: Text('取消')),
          CupertinoDialogAction(
              onPressed: () {
                print('确认的逻辑');
              },
              child: Text('确认')),
        ],
      ),
    );
  }
}
