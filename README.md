## Flash Tron Wallet 

- 1.数字钱包
- 2.聚合交易
- 3.借贷(TODO)

<img src="asset/doc/ft-wallet01.jpeg"  width="320" alt="image-01" style="display: inline-block" /><img src="asset/doc/ft-wallet03.jpeg"  width="320" alt="image-03" style="display: inline-block" />

## 主要开源插件选型

- 1.状态和路由管理getx插件

- 2.Http请求库dio插件

- 3.调用公链服务gRPC插件

- 4.屏幕适配flutter_screenutil插件

- 5.上拉加载下拉刷新flutter_easyrefresh插件

- 6.轻提示fluttertoast插件

- 8.数据存储shared_preferences插件

- 8.生成二维码qr_flutter插件

- 9.扫描二维码scan插件

- 10.版本更新ota_update插件

- 11.获取版本信息package_info插件

- 12.获取App路径path_provider插件

- 13.加载页面url_launcher插件

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
>tron                           tron公链gRPC服务<br>

>main.dart                      执行入口<br>