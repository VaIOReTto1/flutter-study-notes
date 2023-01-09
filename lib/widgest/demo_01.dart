import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.yellow,
      child: Text(
        "文本" * 20,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: () {},
        child: Text("漂浮按钮"),
      ),
      TextButton(
        onPressed: () {},
        child: Text("扁平按钮"),
      ),
      TextButton.icon(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text("data"),
      ),
      OutlinedButton(
        onPressed: () {},
        child: Text("OutlineBUtton"),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.home),
      ),
    ]);
  }
}

class imageIconDemo extends StatelessWidget {
  const imageIconDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.add),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
        Container(
          width: double.infinity,
          child: Image.network(
            "https://s1.ax1x.com/2022/10/26/xfPaJ1.jpg",
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}

class CheckDemo extends StatefulWidget {
  @override
  State<CheckDemo> createState() => _CheckDemoState();
}

class _CheckDemoState extends State<CheckDemo> {
  bool? _check = false;
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Checkbox(
          value: _check,
          onChanged: (v) {
            setState(() {
              _check = v;
            });
          },
        ),
        Switch(
            value: _switch,
            onChanged: (v) {
              setState(() {
                _switch = v;
              });
            })
      ],
    );
  }
}

class ProgressDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: 0.5,
            valueColor: AlwaysStoppedAnimation(Colors.yellow),
          ),
          SizedBox(height: 35),
          Container(
            height: 80,
            width: 80,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
              value: 0.7,
            ),
          ),
          SizedBox(height: 30),
          CupertinoActivityIndicator(
            color: Colors.pink,
          )
        ],
      ),
    );
  }
}

class ClickDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tap");
      },
      onDoubleTap: () {
        print("double tap");
      },
      child: Icon(Icons.radio_button_checked),
    );
  }
}

