# [Flash Finance](https://flash2c.cn/)

## Flash Tron Wallet(简单、易用、安全)

- 1.数字钱包(创建钱包、导入助记词、导入私钥、备份助记词、备份私钥、代币余额查询、多地址切换管理、转账、收款)
- 2.聚合交易(聚合JustSwap、 行情价格、资金池、代币兑换)
- 3.聚合借贷(聚合JustLend、借贷) TODO

<img src="asset/doc/ft-wallet01.jpeg"  width="320" alt="image-01" style="display: inline-block" /><img src="asset/doc/ft-wallet03.jpeg"  width="320" alt="image-03" style="display: inline-block" />

## 主要开源插件选型

- 1.状态和路由管理getx

- 2.http请求库dio

- 3.调用公链服务gRPC

- 4.屏幕适配flutter_screenutil

- 5.上拉加载下拉刷新flutter_easyrefresh

- 6.轻提示fluttertoast

- 7.数据存储shared_preferences

- 8.生成二维码qr_flutter

- 9.扫描二维码scan

- 10.版本更新ota_update

- 11.获取版本信息package_info

- 12.获取app路径path_provider

- 13.加载页面url_launcher

## lib目录分层
>common
>>config                        配置<br>
>>enum                          枚举<br>
>>util                          工具<br>
>>widget                        组件<br>

>entity                         数据模型<br>
>model                          数据模型<br>

>index                          页面相关
>>asset                         资产<br>
>>trade                         交易<br>
>>mine                          我的<br>

>locale                         中英文国际化<br>
>provider                       状态管理(调用服务、数据变更)<br>
>route                          路由管理<br>
>tron                           公链gRPC服务<br>

>main.dart                      执行入口<br>