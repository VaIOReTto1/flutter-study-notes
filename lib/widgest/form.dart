import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({Key? key}) : super(key: key);

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            leading: Switch(
              value: _switchValue,
              onChanged: (bool val) {
                setState(() {
                  _switchValue = val;
                });
              },
              activeColor: Colors.orange,
              activeTrackColor: Colors.pink,
              inactiveTrackColor: Colors.grey,
              inactiveThumbColor: Colors.blue[100],
            ),
            title: Text('当前的状态是：${_switchValue == true ? "选中" : "未选中"}'),
          ),
          ListTile(
            leading: CupertinoSwitch(
              value: _switchValue,
              onChanged: (bool val) {
                setState(() {
                  _switchValue = val;
                });
              },
              activeColor: Colors.red,
              trackColor: Colors.yellow,
            ),
            title: Text('当前的状态是：${_switchValue == true ? "选中" : "未选中"}'),
          )
        ],
      ),
    );
  }
}

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({Key? key}) : super(key: key);

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _male = true;
  bool _female = false;
  bool _val1 = true;
  bool _val2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
            value: this._male,
            onChanged: (bool? value) {
              setState(() {
                this._male = value!;
              });
            },
          ),
          title: Text('男'),
        ),
        ListTile(
          leading: Checkbox(
            value: this._female,
            onChanged: (bool? value) {
              setState(() {
                this._female = value!;
              });
            },
          ),
          title: Text('女'),
        ),
        CheckboxListTile(
          secondary: Icon(Icons.settings, size: 50),
          value: this._val1,
          onChanged: (bool? value) {
            setState(() {
              this._val1 = value!;
            });
          },
          title: Text('1:00'),
          subtitle: Text('hh'),
          activeColor: Colors.green,
          checkColor: Colors.green,
          selected: this._val1,
        ),
        CheckboxListTile(
          secondary: Icon(Icons.settings, size: 50),
          value: this._val2,
          onChanged: (bool? value) {
            setState(() {
              this._val2 = value!;
            });
          },
          title: Text('1:00'),
          subtitle: Text('hh'),
        )
      ],
    );
  }
}

class RadioDemo extends StatefulWidget {
  const RadioDemo({Key? key}) : super(key: key);

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int gender = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('男'),
              Radio(
                  value: 1,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      this.gender = value!;
                    });
                  }),
              Text('女'),
              Radio(
                  value: 2,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      this.gender = value!;
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(this.gender == 1 ? '男' : '女'),
            ],
          ),
          RadioListTile(
            value: 1,
            groupValue: this.gender,
            onChanged: (value) {
              setState(() {
                this.gender = value!;
              });
            },
            title: Text('男'),
            subtitle: Text('n'),
            secondary: Icon(Icons.person),
            selected: this.gender == 1,
            selectedTileColor: Colors.green[100],
          ),
          RadioListTile(
            value: 2,
            groupValue: this.gender,
            onChanged: (value) {
              setState(() {
                this.gender = value!;
              });
            },
            title: Text('女'),
            subtitle: Text('n'),
            secondary: Icon(Icons.person),
            selected: this.gender == 2,
            selectedTileColor: Colors.green[100],
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  late String phone;
  late String password;
  late String description;

  _register() {
    print(phone);
    print(password);
    print(description);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.mobile_screen_share),
                //获取焦点时，高亮的边框样式
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                )),
                //默认边框样式
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.yellow,
                )),
                labelText: '手机号',
                hintText: '请输入手机号',
                hintStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                )),
            maxLength: 11,
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
          TextField(
            //一个表单只能有一个焦点
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.code_outlined),
                //获取焦点时，高亮的边框样式
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                )),
                //默认边框样式
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.yellow,
                )),
                labelText: '密码',
                hintText: '请输入密码',
                hintStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                )),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          TextField(
            maxLines: 5,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                //获取焦点时，高亮的边框样式
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                )),
                //默认边框样式
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.yellow,
                )),
                labelText: '简介',
                hintText: '请介绍一下自己',
                hintStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                )),
            onChanged: (value) {
              setState(() {
                description = value;
              });
            },
          ),

          //声明按钮
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _register();
              },
              child: Text('提交'),
            ),
          )
        ],
      ),
    );
  }
}

//不完整的calender
class CalenderDEmo extends StatefulWidget {
  const CalenderDEmo({Key? key}) : super(key: key);

  @override
  State<CalenderDEmo> createState() => _CalenderDEmoState();
}

class _CalenderDEmoState extends State<CalenderDEmo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(15),
        children: [_showDatePicker(context), _showDatePickerForYear(context)],
      ),
    );
  }
}

ElevatedButton _showDatePicker(context) {
  return ElevatedButton(
    child: Text('showDatePicker'),
    onPressed: () {
      showDatePicker(
          context: context,
          initialDatePickerMode: DatePickerMode.day,
          //日期选择模式，默认为天数选择
          initialDate: DateTime.now(),
          //初始化选中日期
          firstDate: DateTime(2020, 6),
          //开始日期
          lastDate: DateTime(2021, 6),
          //结束日期
          initialEntryMode: DatePickerEntryMode.calendar,
          //日历弹窗模式

          currentDate: DateTime.now(),
          //当前日期
          helpText: '日期选择器',
          //左上方提示
          cancelText: '取消',
          //取消按钮文案
          confirmText: '确定',
          //确认按钮文案

          errorFormatText: 'errorFormatText',
          //格式错误提示
          errorInvalidText: ' errorInvalidText',
          //输入不在first和last之间日期提示
          fieldHintText: 'fieldHintText',
          //输入框为空时内部提升
          fieldLabelText: 'fieldLabelText',
          //输入框上方提示
          useRootNavigator: true,
          //是否为根导航器
          //设置不可选日期
          selectableDayPredicate: (dayTime) {
            if (dayTime == DateTime(2021, 1, 15)) {
              return false;
            }
            return true;
          });
    },
  );
}

ElevatedButton _showDatePickerForYear(context) {
  return ElevatedButton(
    child: Text('showDatePicker - YearMode'),
    onPressed: () {
      showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.year,
        //日期选择模式，默认为天数选择
        initialDate: DateTime.now(),
        //初始化选中日期
        firstDate: DateTime(2020, 6),
        //开始日期
        lastDate: DateTime(2021, 6),
        //结束日期
        initialEntryMode: DatePickerEntryMode.calendar,
        //日历弹窗模式

        currentDate: DateTime.now(),
        //当前日期
        helpText: '年份选择器',
        //左上方提示
        cancelText: '取消',
        //取消按钮文案
        confirmText: '确定', //确认按钮文案
      );
    },
  );
}

class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String _phone;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: '手机号'),
                    validator: (value) {
                      RegExp reg = new RegExp(r'^\d{11}$'); //匹配手机号是否为11位
                      if (!reg.hasMatch(value!)) {
                        return '手机号非法';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      print('_phone onSaved');
                      _phone = value!;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: '密码'),
                    validator: (value) {
                      return value!.length < 6 ? '密码长度不够' : null;
                    },
                    onSaved: (value) {
                      print('_password onSaved');
                      _password = value!;
                    },
                  )
                ],
              )),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    print('提交成功');
                    //提交表单
                    print('_formkey.currentState!.save() - Before');
                    _formkey.currentState!.save();
                    print('_formkey.currentState!.save() - After');
                    print(_phone);
                    print(_password);
                  }
                },
                child: Text('提交'),
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  _formkey.currentState!.reset();
                },
                child: Text('重置'),
              ))
            ],
          )
        ],
      ),
    );
  }
}
