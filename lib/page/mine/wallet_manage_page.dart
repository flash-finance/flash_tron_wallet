import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class WalletManagePage extends StatefulWidget {
  @override
  _WalletManagePageState createState() => _WalletManagePageState();
}

class _WalletManagePageState extends State<WalletManagePage> {
  bool _langType = true;

  @override
  Widget build(BuildContext context) {
    _langType = Provider.of<IndexProvider>(context, listen: false).langType;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '${S.of(context).mineManageWallet}',
          style: Util.textStyle(context, 2, Colors.grey[900], spacing: 0.2, size: 34),
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
            color: Colors.grey[900],
          ),
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    List<WalletEntity> walletList = Provider.of<HomeProvider>(context, listen: true).walletList;
    return Container(
      child: Column(
        children: <Widget>[
         walletList.length > 0 ? Expanded(child: _walletListWidget(context, walletList)) : _notWalletWidget(context),
        ],
      ),
    );
  }

  Widget _notWalletWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), top: ScreenUtil().setHeight(10), right: ScreenUtil().setWidth(30), bottom: ScreenUtil().setHeight(20)),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(50), bottom: ScreenUtil().setHeight(50)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        image: DecorationImage(
          image: AssetImage('images/bg02.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '${S.of(context).mineNoWallet}',
          style: Util.textStyle(context, 2, Colors.white, spacing: 0.5, size: 28),
        ),
      ),
    );
  }

  Widget _walletListWidget(BuildContext context, List<WalletEntity> walletList) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: walletList.length,
          itemBuilder: (context, index) {
            return _walletItemWidget(context, walletList, index);
          }),
    );
  }

  Widget _walletItemWidget(BuildContext context, List<WalletEntity> list, int index) {
    int selectIndex = Provider.of<HomeProvider>(context, listen: true).selectWalletIndex;
    bool flag = selectIndex == index;
    String name = list[index].name;
    String tronAddress = list[index].tronAddress.substring(0, 10) + '...' + list[index].tronAddress.substring(list[index].tronAddress.length - 10, list[index].tronAddress.length);
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), top: index == 0 ? ScreenUtil().setHeight(10) : ScreenUtil().setHeight(0), right: ScreenUtil().setWidth(30), bottom: ScreenUtil().setHeight(20)),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(40), bottom: ScreenUtil().setHeight(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        image: DecorationImage(
          image: AssetImage('images/bg02.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: () {
          Application.router.navigateTo(context, 'asset/walletDetail/$index', transition: TransitionType.cupertino);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '$name',
                          style: Util.textStyle(context, 2, Colors.white, spacing: 0.5, size: 30),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(50)),
                      flag ? Container(
                        width: ScreenUtil().setWidth(80),
                        padding: _langType ? EdgeInsets.only(top: ScreenUtil().setHeight(2), bottom: ScreenUtil().setHeight(2))
                        : EdgeInsets.only(top: ScreenUtil().setHeight(5), bottom: ScreenUtil().setHeight(5)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Colors.white,
                        ),
                        child: Text(
                          '${S.of(context).commonCurrent}',
                          style: Util.textStyle(context, 2, Util.themeColor, spacing: 0.2, size: 20),
                        ),
                      ) : Container(),
                    ],
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: ScreenUtil().setSp(28),
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: list[index].tronAddress));
                Util.showToast('${S.of(context).commonCopySuccess}');
              },
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '$tronAddress',
                        style: Util.textStyle4En(context, 1, Colors.white, spacing: 0.5, size: 26),
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(50)),
                    Container(
                      child: Image.asset(
                        'icons/copy.png',
                        width: ScreenUtil().setWidth(28),
                        height: ScreenUtil().setWidth(28),
                        color: Colors.white,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }

}
