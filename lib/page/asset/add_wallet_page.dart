import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/page/common/common_page.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AddWalletPage extends StatefulWidget {

  @override
  _AddWalletPageState createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '${S.of(context).assetAddWallet}',
          style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.2 , size: 34),
        ),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.of(context)..pop();
          },
          child: Icon(
            Icons.arrow_back,
            size: ScreenUtil().setSp(45),
            color: Colors.grey[850],
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            IntervalPage(Util.height(25)),
            _bodyWidget(context),
            IntervalPage(Util.height(25)),
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      child: Column(
        children: <Widget>[
          SizedBox(height: Util.height(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, Routes.assetImportKey + '/2', transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: Util.height(30)),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: Util.width(10)),
                      Container(
                        child: Text(
                          '${S.of(context).assetImportPrivateKey}',
                          style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setSp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: Util.width(10)),
                    ],
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: Util.height(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, Routes.assetImportMnemonic + '/2', transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: Util.height(30)),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: Util.width(10)),
                      Container(
                        child: Text(
                          '${S.of(context).assetImportMnemonic}',
                          style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.0, size: 30),
                        ),

                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setSp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: Util.width(10)),
                    ],
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: Util.height(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, Routes.assetBuildFirstWallet + '/2', transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: Util.height(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: Util.width(10)),
                      Container(
                        child: Text(
                          '${S.of(context).assetCreateWallet}',
                          style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setSp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: Util.width(10)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
