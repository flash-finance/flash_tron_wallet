import 'dart:io';

import 'package:flash_tron_wallet/model/dex_info_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'download_page.dart';

class ManagePage extends StatefulWidget {
  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();

  String _pwd;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    String name = homeProvider.name;
    String mnemonic = homeProvider.mnemonic;
    String pwd = homeProvider.pwd;
    if (name != null) {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            mnemonic != null ? _backupMnemonicWidget(context, pwd) : Container(),
            _backupKeyWidget(context, pwd),
            _updateNameWidget(context, pwd),
            _updatePwdWidget(context),
            _delWalletWidget(context),
            _usdtPriceCnyWidget(context),
            _versionWidget(context),
            _nodeWidget(context),
          ],
        ),
      );
    } else {
      return Container(
        child: ListView(
          children: <Widget>[
            _usdtPriceCnyWidget(context),
            _versionWidget(context),
            _nodeWidget(context),
          ],
        ),
      );
    }

  }

  Widget _backupKeyWidget(BuildContext context, String pwd) {
    return InkWell(
      onTap: () {
        return showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text('请输入密码', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.grey[800]),),
              content: Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        onSaved: (String value) {
                          if (value.length > 6) {
                            value = value.substring(0, 6);
                          }
                          _pwd = value;
                        },
                        decoration: InputDecoration(
                          hintText: '',
                          filled: true,
                          fillColor: Colors.white,
                          //border:InputBorder.none,
                        ),
                        obscureText: true,
                        maxLength: 6,
                        maxLengthEnforced: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                        validator: (String value) {
                          if (value.length < 6) {
                            return '密码为6位';
                          } else if (value.substring(0, 6) != pwd) {
                            return '密码不正确';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('取消', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text('确定', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _backupKey().then((val) {
                          if (val == true) {
                            Navigator.pop(context);
                            Application.router.navigateTo(context, 'mine/backupKey', transition: TransitionType.cupertino);
                          } else {
                            Util.showToast('执行出错，请再尝试');
                          }
                        });
                      }

                    }
                ),
              ],
            ));
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(top: 10),
        child: _listTileWidget('备份私钥'),
      ),
    );
  }

  Widget _backupMnemonicWidget(BuildContext context, String pwd) {
    return InkWell(
      onTap: () {
        return showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text('请输入密码', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.grey[800]),),
              content: Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        onSaved: (String value) {
                          if (value.length > 6) {
                            value = value.substring(0, 6);
                          }
                          _pwd = value;
                        },
                        decoration: InputDecoration(
                          hintText: '',
                          filled: true,
                          fillColor: Colors.white,
                          //border:InputBorder.none,
                        ),
                        obscureText: true,
                        maxLength: 6,
                        maxLengthEnforced: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                        validator: (String value) {
                          if (value.length < 6) {
                            return '密码为6位';
                          } else if (value.substring(0, 6) != pwd) {
                            return '密码不正确';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('取消', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text('确定', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _backupKey().then((val) {
                          if (val == true) {
                            Navigator.pop(context);
                            Application.router.navigateTo(context, 'mine/backupMnemonic', transition: TransitionType.cupertino);
                          } else {
                            Util.showToast('执行出错，请再尝试');
                          }
                        });
                      }

                    }
                ),
              ],
            ));
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(top: 10),
        child: _listTileWidget('备份助记词'),
      ),
    );
  }

  Widget _updateNameWidget(BuildContext context, String pwd) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, 'mine/updateName', transition: TransitionType.cupertino);
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(top: 10),
        child: _listTileWidget('修改名称'),
      ),
    );
  }

  Widget _updatePwdWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, 'mine/updatePwd', transition: TransitionType.cupertino);
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(top: 10),
        child: _listTileWidget('修改密码'),
      ),
    );
  }


  Widget _delWalletWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        return showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text('请确保私钥或助记词已备份，确定删除?', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.grey[800]),),
              actions: <Widget>[
                FlatButton(
                  child: Text('取消', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text('确定', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                    onPressed: () {
                      _delWallet().then((val) {
                        if (val == true) {
                          Navigator.pop(context);
                        } else {
                          Util.showToast('执行出错，请再尝试');
                        }
                      });
                    }
                ),
              ],
            ));
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(top: 10),
        child: _listTileWidget('删除钱包'),
      ),
    );
  }

  Widget _usdtPriceCnyWidget(BuildContext context) {
    double usdtPriceCny = Provider.of<HomeProvider>(context).usdtPriceCny;
    return InkWell(
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(top: 10),
        child: Container(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child:  Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(300),
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text('汇率信息', style: TextStyle(fontSize: ScreenUtil().setSp(29), color: Colors.grey[900]),),
              ),
              Container(
                width: ScreenUtil().setWidth(390),
                padding: EdgeInsets.only(right: 5, bottom: 1.8),
                alignment: Alignment.centerRight,
                child: Text('1 usdt≈${usdtPriceCny.toStringAsFixed(2)} cny',
                  style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.grey[600]),
                maxLines: 1, overflow: TextOverflow.ellipsis,),
              ),
              Container(
                width: ScreenUtil().setWidth(60),
                padding: EdgeInsets.only(right: 19.5),
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios, size: ScreenUtil().setSp(27), color: Colors.grey[700],),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nodeWidget(BuildContext context) {
    int chainType = Provider.of<HomeProvider>(context).chainType;
    String tronGrpcIP = Provider.of<HomeProvider>(context).tronGrpcIP;
    return InkWell(
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(top: 10),
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(300),
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text('节点信息', style: TextStyle(fontSize: ScreenUtil().setSp(29), color: Colors.grey[900]),),
              ),
              Container(
                width: ScreenUtil().setWidth(390),
                padding: EdgeInsets.only(top: 5, right: 5),
                alignment: Alignment.centerRight,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(chainType == 1 ? 'MainChain' : (chainType == 2 ? 'DAppChain' : 'TestNet'),
                      style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Colors.grey[700]),),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3),
                      child: Text('$tronGrpcIP',
                        style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Colors.grey[600]),),
                    ),
                  ],
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(60),
                padding: EdgeInsets.only(right: 19.5),
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios, size: ScreenUtil().setSp(27), color: Colors.grey[600],),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _versionWidget(BuildContext context) {
    DexInfo dexInfo = Provider.of<HomeProvider>(context).dexInfo;
    String currentVersion = Provider.of<HomeProvider>(context).currentVersion;

    int androidNeedUpdateType = 0;
    int iosNeedUpdateType = 0;

    if (Platform.isAndroid && dexInfo.androidVersionNum != null) {
      if (currentVersion.compareTo(dexInfo.androidVersionNum) == -1) {
        androidNeedUpdateType = dexInfo.androidUpdateType;
      }
    }
    if (Platform.isIOS && dexInfo.iosVersionNum != null) {
      if (currentVersion.compareTo(dexInfo.iosVersionNum) == -1) {
        iosNeedUpdateType = dexInfo.iosUpdateType;
      }
    }

    //print('_versionWidget currentVersion: $currentVersion');
    //print('_versionWidget androidNeedUpdateType:$androidNeedUpdateType');
    //print('_versionWidget iosNeedUpdateType:$iosNeedUpdateType');

    return InkWell(
      onTap: () async {
        if (Platform.isAndroid && dexInfo.androidVersionNum != null) {
          if (androidNeedUpdateType == 0) {
            Util.showToast('当前版本已经是最新版本');
          } else if (androidNeedUpdateType == 1) {
            return showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('新版本V${dexInfo.androidVersionNum}', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.grey[800]),),
                  content: Container(
                    padding: EdgeInsets.only(top: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${dexInfo.androidUpdateInfo.replaceAll('\\n', '\n')}',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: ScreenUtil().setSp(25), color: Colors.grey[900], height: ScreenUtil().setSp(3.2)),),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('以后再说', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                      onPressed: () => Navigator.pop(context),
                    ),
                    FlatButton(
                        child: Text('立即体验', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                        onPressed: () {
                          Navigator.pop(context);
                          return showDialog(
                              context: context,
                              barrierDismissible: false,
                              child: DownloadPage(dexInfo.androidDownloadUrl)
                          );
                        }
                    ),
                  ],
                ));
          }
        }

        if (Platform.isIOS && dexInfo.iosVersionNum != null) {
          if (iosNeedUpdateType == 0) {
            Util.showToast('当前版本已经是最新版本');
          } else if (iosNeedUpdateType == 1) {
            return showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('新版本V${dexInfo.iosVersionNum}', style: TextStyle(fontSize: ScreenUtil().setSp(29), color: Colors.grey[800]),),
                  content: Container(
                    padding: EdgeInsets.only(top: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${dexInfo.iosUpdateInfo.replaceAll('\\n', '\n')}',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: ScreenUtil().setSp(25), color: Colors.grey[900], height: ScreenUtil().setSp(3.2)),),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('以后再说', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                      onPressed: () => Navigator.pop(context),
                    ),
                    FlatButton(
                        child: Text('立即体验', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                        onPressed: ()  async {
                          if(await canLaunch(dexInfo.iosDownloadUrl)) {
                            await launch(dexInfo.iosDownloadUrl);
                          } else {
                            print('could not launch ${dexInfo.iosDownloadUrl}');
                          }
                        }
                    ),
                  ],
                ));
          }
        }

      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(top: 10),
        child: Container(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(300),
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text('当前版本', style: TextStyle(fontSize: ScreenUtil().setSp(29), color: Colors.grey[900]),),
              ),
              versionSubWidget(currentVersion, androidNeedUpdateType, iosNeedUpdateType),
              Container(
                width: ScreenUtil().setWidth(60),
                padding: EdgeInsets.only(right: 19.5),
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios, size: ScreenUtil().setSp(27), color: Colors.grey[700],),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget versionSubWidget(String currentVersion, int androidNeedUpdateType, int iosNeedUpdateType) {
    if (androidNeedUpdateType == 1 || iosNeedUpdateType == 1) {
      return Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(350),
            padding: EdgeInsets.only(right: 5, bottom: 1.8),
            alignment: Alignment.centerRight,
            child: Text(
              '$currentVersion',
              style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.grey[600]),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(40),
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: Icon(Icons.brightness_1, size: ScreenUtil().setSp(15), color: Colors.blue[800],)
          )
        ],
      );
    } else {
      return Container(
        width: ScreenUtil().setWidth(390),
        padding: EdgeInsets.only(right: 10, bottom: 1.8),
        alignment: Alignment.centerRight,
        child: Text(
          '$currentVersion',
          style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.grey[600]),
        ),
      );
    }
  }


  Widget _listTileWidget(String title) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: ScreenUtil().setSp(29), color: Colors.grey[900]),),
        trailing: Icon(Icons.arrow_forward_ios, size: ScreenUtil().setSp(27), color: Colors.grey[700],),
      ),
    );
  }

  Future<bool> _backupKey() async {
    return true;
  }

  Future<bool> _delWallet() async {
    return await Provider.of<HomeProvider>(context, listen: false).delWallet();
  }

}
