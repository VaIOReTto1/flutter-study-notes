import 'package:flutter/material.dart';

class SingleChildScrollViewDemo extends StatelessWidget {
  const SingleChildScrollViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              OutlinedButton(onPressed: () {}, child: Text("按钮")),
              OutlinedButton(onPressed: () {}, child: Text("按钮")),
              OutlinedButton(onPressed: () {}, child: Text("按钮")),
              OutlinedButton(onPressed: () {}, child: Text("按钮")),
              OutlinedButton(onPressed: () {}, child: Text("按钮")),
              OutlinedButton(onPressed: () {}, child: Text("按钮")),
              OutlinedButton(onPressed: () {}, child: Text("按钮")),
              OutlinedButton(onPressed: () {}, child: Text("按钮1")),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(10),
          reverse: false,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              100,
              (index) =>
                  OutlinedButton(onPressed: () {}, child: Text("按钮$index")),
            ),
          ),
        )
      ],
    );
  }
}

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListViewBasic(),
          Divider(),
          ListViewHorizontal(),
          Divider(),
          ListViewBuilderDemo(),
          Divider(),
          ListSeperatedDemo(),
        ],
      ),
    );
  }
}

class ListViewBasic extends StatelessWidget {
  const ListViewBasic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.accessible_forward_sharp, size: 50),
            title: Text("xxx"),
            subtitle: Text("hhh"),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.accessible, size: 50),
            title: Text("xxx"),
            subtitle: Text("hhh"),
            trailing: Icon(Icons.chevron_right),
            selected: true,
            selectedTileColor: Colors.red[100], //当childre后面接const时不能用[]
          ),
          ListTile(
            leading: Icon(Icons.accessible_forward, size: 50),
            title: Text("xxx"),
            subtitle: Text("hhh"),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.ac_unit, size: 50),
            title: Text("xxx"),
            subtitle: Text("hhh"),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.abc, size: 50),
            title: Text("xxx"),
            subtitle: Text("hhh"),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 160,
            color: Colors.amber,
          ),
          Container(
            width: 160,
            color: Colors.green,
          ),
          Container(
            width: 160,
            color: Colors.grey,
          ),
          Container(
            width: 160,
            color: Colors.red,
          ),
          Container(
            width: 160,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class ListViewBuilderDemo extends StatelessWidget {
  final List<Widget> users = new List<Widget>.generate(
      20, (index) => OutlinedButton(onPressed: () {}, child: Text("商品$index")));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
          itemCount: users.length,
          itemExtent: 30,
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return users[index];
          }),
    );
  }
}

class ListSeperatedDemo extends StatelessWidget {
  final List<Widget> users = new List<Widget>.generate(
      20,
      (index) => ListTile(
            leading: Icon(Icons.flutter_dash_sharp),
            title: Text('商品$index'),
            subtitle: Text('xxx'),
            trailing: Icon(Icons.chevron_right),
          ));

  @override
  Widget build(BuildContext context) {
    Widget dividerone = Divider(
      color: Colors.blue,
      thickness: 2,
    );
    Widget dividertwo = Divider(
      color: Colors.red,
      thickness: 2,
    );
    return Column(
      children: [
        ListTile(
          title: Text('商品列表'),
        ),
        Container(
            height: 150,
            child: ListView.separated(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return users[index];
              },
              separatorBuilder: (context, index) {
                return index % 2 == 0 ? dividerone : dividertwo;
              },
            ))
      ],
    );
  }
}

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //指定列数
          mainAxisSpacing: 20, //主轴方向的间距
          crossAxisSpacing: 10, //交叉轴的间距
          childAspectRatio: 1.5, //子组件的宽高比例
        ),
        children: [
          Container(color: Colors.tealAccent),
          Container(color: Colors.amberAccent),
          Container(color: Colors.redAccent),
          Container(color: Colors.blueGrey),
          Container(color: Colors.pinkAccent),
          Container(color: Colors.lightGreenAccent),
          Container(color: Colors.limeAccent),
          Container(color: Colors.blueGrey),
          Container(color: Colors.pinkAccent),
        ],
      ),
      /*GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 190,
          mainAxisSpacing: 30,
          crossAxisSpacing: 10,
          childAspectRatio: .8,
        ),
        children: [
          Container(color: Colors.tealAccent),
          Container(color: Colors.amberAccent),
          Container(color: Colors.redAccent),
          Container(color: Colors.blueGrey),
          Container(color: Colors.pinkAccent),
          Container(color: Colors.lightGreenAccent),
          Container(color: Colors.limeAccent),
          Container(color: Colors.blueGrey),
          Container(color: Colors.pinkAccent),
        ],),*/
    );
  }
}

class GrideViewCountDemo extends StatelessWidget {
  const GrideViewCountDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        children: List.generate(16, (index) => Icon(Icons.accessible_forward)),
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: EdgeInsets.symmetric(horizontal: 40),
        childAspectRatio: 1.5,
      ),
    );
  }
}

class GrideViewExtentDemo extends StatelessWidget {
  const GrideViewExtentDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.extent(
        children: List.generate(16, (index) => Icon(Icons.accessible_forward)),
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: EdgeInsets.symmetric(horizontal: 40),
        childAspectRatio: 1.5,
      ),
    );
  }
}

class GrideViewBuilderDemo extends StatelessWidget {
  final List<dynamic> _tiles = [
    Container(color: Colors.tealAccent),
    Container(color: Colors.amberAccent),
    Container(color: Colors.redAccent),
    Container(color: Colors.blueGrey),
    Container(color: Colors.pinkAccent),
    Container(color: Colors.lightGreenAccent),
    Container(color: Colors.limeAccent),
    Container(color: Colors.blueGrey),
    Container(color: Colors.pinkAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.0,
        ),
        itemCount: _tiles.length,
        itemBuilder: (context, index) {
          return _tiles[index];
        },
        physics: BouncingScrollPhysics(), //反弹效果，允许拉出边界
        //physics: ClampingScrollPhysics(),//夹住效果，不允许拉出边界
        //physics: NeverScrollableScrollPhysics(),//不允许滚动
      ),
    );
  }
}
