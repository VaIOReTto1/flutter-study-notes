import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class layout extends StatelessWidget {
  const layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("layout practice"),
      ),
      body: Container(
        //color: Colors.grey,
        // child: Column(
        //       children: [
        //         Container(
        //           color: Colors.yellow,
        //           height: 100,
        //           width: 100,
        //         ),
        //         Container(
        //           color: Colors.yellow,
        //           height: 100,
        //           width: 150,
        //         ),
        //         Container(
        //           color: Colors.yellow,
        //           height: 100,
        //           width: 100,
        //         ),
        //       ],
        //     )
        //     child: Row(
        //       //textDirection: TextDirection.rtl,
        //       mainAxisSize: MainAxisSize.max,
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       children: [
        //         Container(
        //           color: Colors.yellow,
        //           height: 100,
        //           width: 100,
        //         ),
        //         Container(
        //           color: Colors.green,
        //           height: 150,
        //           width: 100,
        //         ),
        //         Container(
        //           color: Colors.red,
        //           height: 100,
        //           width: 100,
        //         ),
        //       ],
        //     )
        // child: Flex(
        //   direction: Axis.vertical,
        //   children: [
        //     Expanded(
        //       child: Container(
        //         color: Colors.yellow,
        //         height: 100,
        //         width: 100,
        //       ),
        //       flex: 1,
        //     ),
        //     Expanded(
        //       child: Container(
        //         color: Colors.green,
        //         height: 150,
        //         width: 100,
        //       ),
        //       flex: 2,
        //     ),
        //     Expanded(
        //       child: Container(
        //         color: Colors.red,
        //         height: 100,
        //         width: 100,
        //       ),
        //       flex: 1,
        //     )
        //   ],
        // ),
        // child: WrapDemo(),
        // child: StackDemo(),
        // child: AlignDemo(),
        child: EdgeDemo(),
      ),
    );
  }
}

class WrapDemo extends StatefulWidget {
  const WrapDemo({Key? key}) : super(key: key);

  @override
  State<WrapDemo> createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  List<int> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 20; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 1.0,
        runSpacing: 1.0,
        direction: Axis.vertical,
        alignment: WrapAlignment.spaceAround,
        children: list
            .map((e) =>
            Container(
              height: 100,
              width: 100,
              child: Text(e.toString()),
              color: Colors.blue,
            ))
            .toList());
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          color: Colors.grey,
          height: 110,
          width: 110,
        ),
        Container(
          color: Colors.red,
          height: 50,
          width: 20,
        ),
        Positioned(
          width: 20,
          height: 20,
          child: Container(
            color: Colors.blue,
          ),
          //top: 10,
          bottom: 10,
          //left: 10,
          right: 10,
        )
      ],
    );
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      width: 200,
      height: 200,
      color: Colors.grey,
      child: const Align(
        alignment: Alignment(-1, 1.5),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}

class EdgeDemo extends StatelessWidget {
  const EdgeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 200,
    //   height: 200,
    //   color: Colors.yellow,
    //   margin: EdgeInsets.all(8),
    //   padding: EdgeInsets.all(20),
    //   child: Text("flutter"),
    // );
    // return ConstrainedBox(constraints: BoxConstraints(
    //   minHeight: 50,
    //   minWidth: 50,
    //   maxHeight: 100,
    //   maxWidth: 100,
    // ),
    // child: Container(
    //   width: 10,
    //   height: 500,
    //   color: Colors.yellow,
    // ),
    // );
    // return SizedBox(
    //   width: 100,
    //   height: 100,
    //   child: Container(
    //     width: 200,
    //     height: 10,
    //     color: Colors.yellow,
    //   ),
    // );
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.green,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(2.0, 2.0),
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20,),
          child: Text(
            "sign in",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}

class CartDemo extends StatelessWidget {
  const CartDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(30),
          color: Colors.green[100],
          shadowColor: Colors.yellow,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(
              color: Colors.yellow,
              width: 3,
            )
          ),
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
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "地址：xxxxxxx",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              )
            ],
          ),
        ),
        Card(child: Column(
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
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            ListTile(
              title: Text(
                "地址：xxxxxxx",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            )
          ],
        ),)
      ],
    );
  }
}


