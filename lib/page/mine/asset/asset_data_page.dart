
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/model/dex_info_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/tron/service/tron_asset.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class AssetDataPage extends StatefulWidget {
  @override
  _AssetDataPageState createState() => _AssetDataPageState();
}

class _AssetDataPageState extends State<AssetDataPage> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    List<AssetEntity> assetList = homeProvider.assetList;
    String assetHide = Provider.of<HomeProvider>(context).assetHide;
    if (assetList != null && assetList.length >= 2) {
      return Expanded(
        child: Container(
          width: ScreenUtil().setWidth(750),
          child: EasyRefresh(
            header: MaterialHeader(enableHapticFeedback: true),
            footer: MaterialFooter(enableHapticFeedback: true, enableInfiniteLoad: false),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: assetList.length,
                itemBuilder: (context, index) {
                  return _dataWidget(context, index, assetList[index], assetHide);
                }),
            onRefresh: () async {
              _getAsset();
            },
          ),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          color: Colors.white,
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      );
    }
  }

  Widget _dataWidget(BuildContext context, int index, AssetEntity item, String assetHide) {
    bool flag = item.name == 'TRX' ? true : false;
    return InkWell(
      onTap: () {
      },
      child: Container(
        width: ScreenUtil().setWidth(720),
        margin: index == 0 ? EdgeInsets.fromLTRB(15, 10, 15, 5) : EdgeInsets.fromLTRB(15, 0, 15, 5),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            children: <Widget>[
              !flag ? Container(
                width: ScreenUtil().setWidth(720),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12, width: 0.6)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: ScreenUtil().setWidth(30),
                        height: ScreenUtil().setWidth(30),
                        margin: EdgeInsets.only(left: 20),
                        child: Image.network(
                          '${item.logoUrl}',
                          fit: BoxFit.cover,
                        )
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          '${item.name}',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: ScreenUtil().setSp(28),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                    ),
                  ],
                ),
              ) :
              Container(
                width: ScreenUtil().setWidth(720),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12, width: 0.6)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: ScreenUtil().setWidth(30),
                              height: ScreenUtil().setWidth(30),
                              margin: EdgeInsets.only(left: 20),
                              child: CachedNetworkImage(
                                imageUrl: '${item.logoUrl}',
                                fit: BoxFit.cover,
                              )
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                '${item.name}',
                                style: TextStyle(
                                  color: Colors.blue[800],
                                  fontSize: ScreenUtil().setSp(28),
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 20),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '冻结  ',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: ScreenUtil().setSp(25),
                              ),
                            ),
                            TextSpan(
                              text: assetHide != '1' ? '${Util.formatNumberSub(item.frozen, 3)}' : '*****',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: ScreenUtil().setSp(27),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: _itemWidget(context, item, assetHide),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemWidget(BuildContext context, AssetEntity item, String assetHide) {
    return Container(
      width: ScreenUtil().setWidth(720),
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    '可用',
                    style: TextStyle(color: Colors.grey[600], fontSize: ScreenUtil().setSp(25)),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.only(top: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    assetHide != '1' ? '${Util.formatNumberSub(item.balance, 3)}' : '*****',
                    style: TextStyle(color: Colors.grey[800], fontSize: ScreenUtil().setSp(27), fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    '折合(CNY)',
                    style: TextStyle(color: Colors.grey[600], fontSize: ScreenUtil().setSp(25)),),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    assetHide != '1' ? '${Util.formatNumberSub(item.cny, 2)}' : '*****',
                    style: TextStyle(color: Colors.grey[800], fontSize: ScreenUtil().setSp(27), fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Future<bool> _getAsset() async {
    String tronAddress = Provider.of<HomeProvider>(context, listen: false).tronAddress;
    List<TokenRows> tokenList = Provider.of<HomeProvider>(context, listen: false).tokenList;
    return await TronAsset().getAsset(context, tronAddress, tokenList);
  }
}
