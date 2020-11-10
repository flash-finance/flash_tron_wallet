class DexInfoRespModel {
  int code;
  String msg;
  DexInfoData data;

  DexInfoRespModel({this.code, this.msg, this.data});

  DexInfoRespModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new DexInfoData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class DexInfoData {
  DexInfo dexInfo;
  List<TokenRows> tokenRows;

  DexInfoData({this.dexInfo, this.tokenRows});

  DexInfoData.fromJson(Map<String, dynamic> json) {
    dexInfo =
    json['dexInfo'] != null ? new DexInfo.fromJson(json['dexInfo']) : null;
    if (json['tokenRows'] != null) {
      tokenRows = new List<TokenRows>();
      json['tokenRows'].forEach((v) {
        tokenRows.add(new TokenRows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dexInfo != null) {
      data['dexInfo'] = this.dexInfo.toJson();
    }
    if (this.tokenRows != null) {
      data['tokenRows'] = this.tokenRows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DexInfo {
  int id;
  int chainType;
  String tronGrpcIP;
  double trxPriceUsdt;
  double usdtPriceCny;
  double dexLimitOrderTrx;
  double dexLimitOrderUsdt;
  String dexContract;
  String androidVersionNum;
  String androidDownloadUrl;
  String androidUpdateInfo;
  int androidUpdateType;
  String iosVersionNum;
  String iosDownloadUrl;
  String iosUpdateInfo;
  int iosUpdateType;

  DexInfo(
      {this.id,
        this.chainType,
        this.tronGrpcIP,
        this.trxPriceUsdt,
        this.usdtPriceCny,
        this.dexLimitOrderTrx,
        this.dexLimitOrderUsdt,
        this.dexContract,
        this.androidVersionNum,
        this.androidDownloadUrl,
        this.androidUpdateInfo,
        this.androidUpdateType,
        this.iosVersionNum,
        this.iosDownloadUrl,
        this.iosUpdateInfo,
        this.iosUpdateType});

  DexInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chainType = json['chainType'];
    tronGrpcIP = json['tronGrpcIP'];
    trxPriceUsdt = (json['trxPriceUsdt'] as num)?.toDouble();
    usdtPriceCny = (json['usdtPriceCny'] as num)?.toDouble();
    dexLimitOrderTrx = (json['dexLimitOrderTrx'] as num)?.toDouble();
    dexLimitOrderUsdt = (json['dexLimitOrderUsdt'] as num)?.toDouble();
    dexContract = json['dexContract'];
    androidVersionNum = json['androidVersionNum'];
    androidDownloadUrl = json['androidDownloadUrl'];
    androidUpdateInfo = json['androidUpdateInfo'];
    androidUpdateType = json['androidUpdateType'];
    iosVersionNum = json['iosVersionNum'];
    iosDownloadUrl = json['iosDownloadUrl'];
    iosUpdateInfo = json['iosUpdateInfo'];
    iosUpdateType = json['iosUpdateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chainType'] = this.chainType;
    data['tronGrpcIP'] = this.tronGrpcIP;
    data['trxPriceUsdt'] = this.trxPriceUsdt;
    data['usdtPriceCny'] = this.usdtPriceCny;
    data['dexLimitOrderTrx'] = this.dexLimitOrderTrx;
    data['dexLimitOrderUsdt'] = this.dexLimitOrderUsdt;
    data['dexContract'] = this.dexContract;
    data['androidVersionNum'] = this.androidVersionNum;
    data['androidDownloadUrl'] = this.androidDownloadUrl;
    data['androidUpdateInfo'] = this.androidUpdateInfo;
    data['androidUpdateType'] = this.androidUpdateType;
    data['iosVersionNum'] = this.iosVersionNum;
    data['iosDownloadUrl'] = this.iosDownloadUrl;
    data['iosUpdateInfo'] = this.iosUpdateInfo;
    data['iosUpdateType'] = this.iosUpdateType;
    return data;
  }
}

class TokenRows {
  int id;
  int tokenType;
  String tokenShort;
  String tokenAddress;
  int tokenPrecision;
  String logoUrl;
  double priceTrx;
  int status;

  TokenRows(
      {this.id,
        this.tokenType,
        this.tokenShort,
        this.tokenAddress,
        this.tokenPrecision,
        this.logoUrl,
        this.priceTrx,
        this.status});

  TokenRows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tokenType = json['tokenType'];
    tokenShort = json['tokenShort'];
    tokenAddress = json['tokenAddress'];
    tokenPrecision = json['tokenPrecision'];
    logoUrl = json['logoUrl'];
    priceTrx = (json['priceTrx'] as num)?.toDouble();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tokenType'] = this.tokenType;
    data['tokenShort'] = this.tokenShort;
    data['tokenAddress'] = this.tokenAddress;
    data['tokenPrecision'] = this.tokenPrecision;
    data['logoUrl'] = this.logoUrl;
    data['priceTrx'] = this.priceTrx;
    data['status'] = this.status;
    return data;
  }
}
