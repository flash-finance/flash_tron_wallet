
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateNamePage extends StatefulWidget {
  @override
  _UpdateNamePageState createState() => _UpdateNamePageState();
}

class _UpdateNamePageState extends State<UpdateNamePage> {
  final _formKey = GlobalKey<FormState>();
  String _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '修改钱包名称',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(35),
          ),
        ),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(15),
            children: <Widget>[
              _nameWidget(),
              SizedBox(height: ScreenUtil().setHeight(80)),
              _submitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameWidget() {
    return Container(
      child: TextFormField(
        onSaved: (String value) => _name = value,
        maxLength: 10,
        inputFormatters: [],
        decoration: InputDecoration(
          labelText: '钱包名称',
          labelStyle: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '钱包名称不能为空';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Container(
      child: Align(
        child: SizedBox(
          width: ScreenUtil().setWidth(400),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text('提交', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(31))),
            ),
            color: Colors.blue[800],
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _submit().then((val) {
                  if (val == true) {
                    Util.showToast('修改成功');
                    Navigator.pop(context);
                  } else {
                    Util.showToast('执行出错，请再尝试');
                  }
                });
              }
            },
            shape: StadiumBorder(side: BorderSide(color: Colors.blue[800])),
          ),
        ),
      ),
    );
  }

  Future<bool> _submit() async {
    return await Provider.of<HomeProvider>(context, listen: false).updateName(_name);
  }
}
