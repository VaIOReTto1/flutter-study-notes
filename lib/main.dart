import 'package:flutter/material.dart';
import 'package:learn1/widgest/Animation.dart';
import 'package:learn1/widgest/State_demo.dart';
import 'package:learn1/widgest/demo_01.dart';
import 'package:learn1/widgest/form.dart';
import 'package:learn1/widgest/layout_demo.dart';
import 'package:learn1/widgest/list_demo.dart';
import 'package:learn1/widgest/navigator_demo.dart';
import 'package:learn1/widgest/other_demo.dart';
import 'package:learn1/widgest/thirdPackage.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("learn1"),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: HeroAnimationDemo(),
    );
  }
}

class CountPage extends StatefulWidget {
  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$count"),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text("点击"),
        ),
      ],
    );
  }
}



