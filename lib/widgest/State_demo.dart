import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn1/main.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({Key? key}) : super(key: key);

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  GlobalKey _key = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  FocusNode _u = FocusNode();
  FocusNode _p = FocusNode();
  late FocusScopeNode _focusScopeNode;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _user.dispose();
    _pass.dispose();
    _u.dispose();
    _p.dispose();
    if (_focusScopeNode != null) _focusScopeNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            focusNode: _u,
            controller: _user,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add),
              labelText: "ID",
              hintText: "Please put in ID",
            ),
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "Please put in ID";
              }
            },
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              print("object");
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _pass,
            focusNode: _p,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add),
              labelText: "Password",
              hintText: "Please put in Password",
            ),
            validator: (v) {
              if (v == null || v.length < 5) {
                return "Please put in Password and Password must bigger than 5";
              }
            },
            textInputAction: TextInputAction.send,
            obscureText: true,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_focusScopeNode == null)
                _focusScopeNode = FocusScope.of(context);
              _focusScopeNode.requestFocus(_u);
              //_focusScopeNode.unfocus();
              print((_key.currentState as FormState).validate().toString());
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}

class User {
  String name;
  int age;
  bool selected;

  User(this.name, this.age, {this.selected = false});
}

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({Key? key}) : super(key: key);

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  List<User> data = [
    User('hh', 18),
    User('xx', 19),
    User('kk', 21),
    User('ll', 10),
  ];
  var _sortAscending = true;

  List<DataRow> _getUsersRows() {
    List<DataRow> dataRows = [];
    for (int i = 0; i < data.length; i++) {
      dataRows.add(
        DataRow(
            selected: data[i].selected,
            onSelectChanged: (selected) {
              setState(() {
                data[i].selected = selected!;
              });
            },
            cells: [
              DataCell(Text('${data[i].name}')),
              DataCell(Text('${data[i].age}')),
              DataCell(Text('男')),
              DataCell(Text('--')),
            ]),
      );
    }
    ;
    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortColumnIndex: 1,
          //按第一列（年龄）排序
          sortAscending: _sortAscending,
          dataRowHeight: 50,
          horizontalMargin: 20,
          columnSpacing: 100,
          columns: [
            DataColumn(label: Text('姓名')),
            DataColumn(
                label: Text('年龄'),
                numeric: true,
                onSort: (int columnIndex, bool asscending) {
                  setState(() {
                    _sortAscending = asscending;
                    if (asscending) {
                      data.sort((a, b) => a.age.compareTo(b.age));
                    } else {
                      data.sort((a, b) => b.age.compareTo(a.age));
                    }
                  });
                }),
            DataColumn(label: Text('性别')),
            DataColumn(label: Text('简介'))
          ],
          rows: _getUsersRows(),
          // [
          // DataRow(cells: [
          //   DataCell(Text('张三')),
          //   DataCell(Text('18')),
          //   DataCell(Text('男')),
          //   DataCell(Text('--'))
          // ]),
          // DataRow(cells: [
          //   DataCell(Text('张三')),
          //   DataCell(Text('18')),
          //   DataCell(Text('男')),
          //   DataCell(Text('--'))
          // ]),
          // DataRow(cells: [
          //   DataCell(Text('张三')),
          //   DataCell(Text('18')),
          //   DataCell(Text('男')),
          //   DataCell(Text('--'))
          // ])
          //],
        ),
      ),
    );
  }
}

class InheritedWidgetDemo extends StatefulWidget {
  const InheritedWidgetDemo({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetDemo> createState() => _InheritedWidgetState();
}

class _InheritedWidgetState extends State<InheritedWidgetDemo> {
  int _num = 0;

  void _increment() {
    setState(() {
      _num++;
    });
  }

  void _decrement() {
    setState(() {
      _num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShareDataWidget(
      num: _num,
      child: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: _decrement, child: Text('-')),
            Padding(padding: EdgeInsets.all(20), child: Mycounter()),
            ElevatedButton(
              onPressed: _increment,
              //child: Icon(Icons.add)
              //跨组间访问数据
              child: Icon(Icons.add)
            )
          ],
        ),
      ),
    );
  }
}

class Mycounter extends StatefulWidget {
  const Mycounter({Key? key}) : super(key: key);

  @override
  State<Mycounter> createState() => _MycounterState();
}

class _MycounterState extends State<Mycounter> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).num.toString());
  }
}

//数据共享组件
class ShareDataWidget extends InheritedWidget {
  final int num;

  const ShareDataWidget({
    required this.num,
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static ShareDataWidget of(BuildContext context) {
    final ShareDataWidget? result =
        context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    assert(result != null, 'No ShareDataWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return true;
  }
}

class lifecycleDemo extends StatefulWidget {
  const lifecycleDemo({Key? key}) : super(key: key);

  @override
  State<lifecycleDemo> createState() => _lifecycleDemoState();
}

class _lifecycleDemoState extends State<lifecycleDemo> {
  int _num = 0;

  //通常根据后台接口的返回值数据对状态进行初始化
  @override
  void initState(){
    super.initState();
    print("init state");
    _num=1;
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant lifecycleDemo oldWidget){
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate(){
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose(){
    super.dispose();
    print("dispose");
  }

  void _increment() {
    setState(() {
      print('set state');
      _num++;
    });
  }

  void _decrement() {
    setState(() {
      print('set state');
      _num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: _decrement,
              child: Text('-')
          ),
          Padding(
              padding: EdgeInsets.all(20),
              child: Text('$_num')
          ),
          ElevatedButton(
              onPressed: _increment,
              child: Icon(Icons.add)
          )
        ],
      ),
    );
  }
}


//1.创建数据模型
class LikesModel extends ChangeNotifier{
  int _counter=0;
  int get counter=>_counter;
  incrementCounter(){
    _counter++;
    //提供UI更新
    notifyListeners();
  }
}

class providerDemo extends StatelessWidget {
  const providerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //3.在子组件中使用数据模型
        children: [
          Text('${context.watch<LikesModel>().counter}'),
          TextButton(onPressed: Provider.of<LikesModel>(context).incrementCounter, child: Icon(Icons.thumb_up))
        ],
      ),
    );
  }
}

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _HomePage(),
    );
  }
}

//provider
class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //2.创建注册数据类型
    return ChangeNotifierProvider(
        create: (BuildContext context) => new LikesModel(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("learn1"),
            elevation: 10.0,
            centerTitle: true,
          ),
          body: providerDemo(),
        ));
  }
}