import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     primaryColor: Colors.red,
      //     accentColor: Colors.yellow,
      //     //针对旧按钮有效
      //     buttonTheme: const ButtonThemeData(
      //         textTheme: ButtonTextTheme.accent,
      //         splashColor: Colors.green,
      //         height: 50),
      //     textTheme: const TextTheme(
      //         subtitle1: TextStyle(fontSize: 30, color: Colors.green)),
      //     iconTheme: const IconThemeData(color: Colors.pink, size: 40),
      //     cardTheme: CardTheme(
      //         color: Colors.brown[100],
      //         shape: Border.all(width: 10, color: Colors.red),
      //         elevation: 20)),

      //适配终端的主题
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),

      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,

      home: HomePage(),
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
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 10.0,
        centerTitle: true,
      ),
      body: ThemeDemo(),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Theme Example',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ElevatedButton(onPressed: () {}, child: Text('按钮')),
          Icon(Icons.person),
          Icon(Icons.access_alarm),
          Icon(
            Icons.access_alarm,
            //color: Colors.green,
            color: Theme.of(context).accentColor,
          ),
          //通过theme来设置局部样式
          Theme(
              data: ThemeData(
                iconTheme: const IconThemeData(color: Colors.blue, size: 60),
              ),
              child: Icon(Icons.person)),
          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(
                    Icons.accessible_forward_sharp,
                    size: 50,
                  ),
                  title: Text(
                    "OTTO",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "吉吉国王",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "电话：000000000",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  title: Text(
                    "地址：xxxxxxx",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTheme {
  //公共样式
  static const double _CardBorderWidth = 10;
  static const double _CardElevation = 20;

  //高亮主题
  static final ThemeData lightTheme = ThemeData(
      primaryColor: Colors.red,
      cardTheme: CardTheme(
          color: Colors.red[100],
          shape: Border.all(width: _CardBorderWidth, color: Colors.red),
          elevation: _CardElevation));

  //黑暗主题
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    cardTheme: CardTheme(
        color: Colors.grey[100],
        shape: Border.all(width: _CardBorderWidth, color: Colors.black45),
        elevation: _CardElevation),
  );
}
