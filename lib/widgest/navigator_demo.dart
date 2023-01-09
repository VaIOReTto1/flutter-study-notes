import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("LoginPage"),
        ),
        body: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("Menu", arguments: "Menu");
          },
          child: const Text("Login"),
        ));
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute
        .of(context)
        ?.settings
        .arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.toString()),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop({
            "name": "flutter",
          });
        },
        child: const Text("return"),
      ),
    );
  }
}

class anonyMousDemo extends StatelessWidget {
  const anonyMousDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Product()));
          },
          child: Text('跳转到商品页面'),
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("商品页面"),
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.settings)],
          elevation: 10.0,
          centerTitle: true,
        ),
        body: Center(
          child: Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('返回'),
            ),
          ),
        ));
  }
}

//nameRoute
main() {
  runApp(tabDemo());
}

class nameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      //声明命名路由
      routes: {
        'homePage': (context) => homePage(),
        'product': (context) => product(),
      },
      initialRoute: 'homePage',
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => UnknowPage()),
    );
  }
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("首页"),
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.settings)],
          elevation: 10.0,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'product'),
                child: Text('跳转'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'user'),
                child: Text('未知路由'),
              )
            ],
          ),
        ));
  }
}

class product extends StatelessWidget {
  const product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("商品页面"),
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.settings)],
          elevation: 10.0,
          centerTitle: true,
        ),
        body: Center(
          child: Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('返回'),
            ),
          ),
        ));
  }
}

class UnknowPage extends StatelessWidget {
  const UnknowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("404"),
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.settings)],
          elevation: 10.0,
          centerTitle: true,
        ),
        body: Center(
          child: Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('返回'),
            ),
          ),
        ));
  }
}

class onGenerateRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings setting) {
        //匹配首页 /
        print('当前路径${setting.name}');
        if (setting.name == '/') {
          return MaterialPageRoute(builder: (context) => _homePage());
        }
        if (setting.name == '/product') {
          return MaterialPageRoute(builder: (context) => product());
        }

        //匹配 /product/:id
        var uri = Uri.parse(setting.name.toString());
        print(uri.pathSegments);
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'product') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => productDetail(id: id));
        }
        return MaterialPageRoute(builder: (context) => UnknowPage());
      },
    );
  }
}

class _homePage extends StatelessWidget {
  const _homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("首页"),
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.settings)],
          elevation: 10.0,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/product'),
                child: Text('跳转'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/product/1'),
                child: Text('商品1'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/product/2'),
                child: Text('商品2'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'user'),
                child: Text('未知路由'),
              )
            ],
          ),
        ));
  }
}

class productDetail extends StatelessWidget {
  final String id;

  const productDetail({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品详情页"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 10.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Text('当前商品的id是${this.id}'),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('返回'),
          )
        ]),
      ),
    );
  }
}

//路由参数
class arguments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'homePage': (context) => homePage_(),
        'product': (context) => _product(),
        'productDetail': (context) => _productDetail(),
      },
      initialRoute: 'homePage',
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => UnknowPage()),
    );
  }
}

class homePage_ extends StatelessWidget {
  const homePage_({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("首页"),
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.settings)],
          elevation: 10.0,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, 'product',
                        arguments: {'title': '我是主页传来的参数'}),
                child: Text('跳转到商品页面'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, 'productDetail',
                        arguments: {'id': 1}),
                child: Text('商品1'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, 'productDetail',
                        arguments: {'id': 2}),
                child: Text('商品2'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'user'),
                child: Text('未知路由'),
              )
            ],
          ),
        ));
  }
}

class _productDetail extends StatelessWidget {
  const _productDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text("商品详情页"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 10.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Text('当前商品的id是' + arguments['id'].toString()),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('返回'),
          )
        ]),
      ),
    );
  }
}

class _product extends StatelessWidget {
  const _product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text("商品页面"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 10.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('接受的参数是' + arguments['title']),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('返回'),
            )
          ],
        ),
      ),
    );
  }
}

//drawer导航
class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: homepage(),
      drawer: DrawerList(),
      endDrawer: DrawerList(),
    );
  }
}

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Home'),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('hhh'),
              accountEmail: Text('skd@qq.com'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/2.png'),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('余额'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('我的'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('回退'),
              onTap: () => Navigator.pop(context),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            AboutListTile(
              child: Text('关于'),
              applicationName: '你的应用名称',
              applicationVersion: '1.0.0',
              icon: CircleAvatar(
                child: Text('aaa'),
              ),
              applicationLegalese: '你的应用名称',
              aboutBoxChildren: [
                Text('条例一：'),
                Text('条例一：'),
              ],
              applicationIcon: Image.asset(
                'images/3.jpg',
                width: 50,
                height: 50,
              ),
            )
          ],
        ));
  }
}

//bottomNavigatorBar
class bottomNavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hOme(),
    );
  }
}

class hOme extends StatefulWidget {
  const hOme({Key? key}) : super(key: key);

  @override
  State<hOme> createState() => _hOmeState();
}

class _hOmeState extends State<hOme> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.home),
      label: '首页',
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.message),
      label: '消息',
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      icon: Icon(Icons.shopping_cart),
      label: '购物车',
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.red,
      icon: Icon(Icons.person),
      label: '我的',
    ),
  ];

  final pages = [
    Center(
      child: Text('Home', style: TextStyle(fontSize: 50),),
    ),
    Center(
      child: Text('Message', style: TextStyle(fontSize: 50),),
    ),
    Center(
      child: Text('Shopping cart', style: TextStyle(fontSize: 50),),
    ),
    Center(
      child: Text('Profile', style: TextStyle(fontSize: 50),),
    )
  ];

  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("底部导航"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.settings)],
        elevation: 0.0,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        //type: BottomNavigationBarType.fixed,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}

//Tab导航
class tabDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: tabhome(),
    );
  }
}

class tabhome extends StatelessWidget {
  //菜单数组
  final List<Widget> _tabs = [
    Tab(text: '首页', icon: Icon(Icons.home)),
    Tab(text: '添加', icon: Icon(Icons.add)),
    Tab(text: '搜索', icon: Icon(Icons.search)),
  ];

  //页面数组
  final List<Widget> _tabViews = [
    Icon(Icons.home, size: 120, color: Colors.red),
    Icon(Icons.add, size: 120, color: Colors.green),
    Icon(Icons.search, size: 120, color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Tab"),
              leading: Icon(Icons.menu),
              actions: [Icon(Icons.settings)],
              elevation: 10.0,
              centerTitle: true,
              bottom: TabBar(
                tabs: _tabs,
                labelColor: Colors.yellow,
                unselectedLabelColor: Colors.black45,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.yellow,
                indicatorWeight: 10,
              ),
            ),
            body:TabBarView(
              children: _tabViews,
            ),
          bottomNavigationBar: TabBar(
            tabs: _tabs,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black45,
          ),
        )
    );
  }
}


