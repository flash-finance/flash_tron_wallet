class TronInfoRespModel {
  int code;
  String msg;
  TronInfoData data;

  TronInfoRespModel({this.code, this.msg, this.data});

  TronInfoRespModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data =
        json['data'] != null ? new TronInfoData.fromJson(json['data']) : null;
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

class TronInfoData {
  TronInfo tronInfo;
  List<TokenRows> tokenRows;

  TronInfoData({this.tronInfo, this.tokenRows});

  TronInfoData.fromJson(Map<String, dynamic> json) {
    tronInfo = json['tronInfo'] != null
        ? new TronInfo.fromJson(json['tronInfo'])
        : null;
    if (json['tokenRows'] != null) {
      tokenRows = new List<TokenRows>();
      json['tokenRows'].forEach((v) {
        tokenRows.add(new TokenRows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tronInfo != null) {
      data['tronInfo'] = this.tronInfo.toJson();
    }
    if (this.tokenRows != null) {
      data['tokenRows'] = this.tokenRows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TronInfo {
  int id;
  int chainType;
  String tronGrpcIP;
  double trxPriceUsd;
  String swapContract;
  String androidVersionNum;
  String androidDownloadUrl;
  String androidUpdateInfo1;
  String androidUpdateInfo2;
  int androidUpdateType;
  String iosVersionNum;
  String iosDownloadUrl;
  String iosUpdateInfo1;
  String iosUpdateInfo2;
  int iosUpdateType;

  TronInfo(
      {this.id,
      this.chainType,
      this.tronGrpcIP,
      this.trxPriceUsd,
      this.swapContract,
      this.androidVersionNum,
      this.androidDownloadUrl,
      this.androidUpdateInfo1,
      this.androidUpdateInfo2,
      this.androidUpdateType,
      this.iosVersionNum,
      this.iosDownloadUrl,
      this.iosUpdateInfo1,
      this.iosUpdateInfo2,
      this.iosUpdateType});

  TronInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chainType = json['chainType'];
    tronGrpcIP = json['tronGrpcIP'];
    trxPriceUsd = (json['trxPriceUsd'] as num)?.toDouble();
    swapContract = json['swapContract'];
    androidVersionNum = json['androidVersionNum'];
    androidDownloadUrl = json['androidDownloadUrl'];
    androidUpdateInfo1 = json['androidUpdateInfo1'];
    androidUpdateInfo2 = json['androidUpdateInfo2'];
    androidUpdateType = json['androidUpdateType'];
    iosVersionNum = json['iosVersionNum'];
    iosDownloadUrl = json['iosDownloadUrl'];
    iosUpdateInfo1 = json['iosUpdateInfo1'];
    iosUpdateInfo2 = json['iosUpdateInfo2'];
    iosUpdateType = json['iosUpdateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chainType'] = this.chainType;
    data['tronGrpcIP'] = this.tronGrpcIP;
    data['trxPriceUsd'] = this.trxPriceUsd;
    data['swapContract'] = this.swapContract;
    data['androidVersionNum'] = this.androidVersionNum;
    data['androidDownloadUrl'] = this.androidDownloadUrl;
    data['androidUpdateInfo1'] = this.androidUpdateInfo1;
    data['androidUpdateInfo2'] = this.androidUpdateInfo2;
    data['androidUpdateType'] = this.androidUpdateType;
    data['iosVersionNum'] = this.iosVersionNum;
    data['iosDownloadUrl'] = this.iosDownloadUrl;
    data['iosUpdateInfo1'] = this.iosUpdateInfo1;
    data['iosUpdateInfo2'] = this.iosUpdateInfo2;
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
  double priceUsd;

  TokenRows(
      {this.id,
      this.tokenType,
      this.tokenShort,
      this.tokenAddress,
      this.tokenPrecision,
      this.logoUrl,
      this.priceTrx,
      this.priceUsd});

  TokenRows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tokenType = json['tokenType'];
    tokenShort = json['tokenShort'];
    tokenAddress = json['tokenAddress'];
    tokenPrecision = json['tokenPrecision'];
    logoUrl = json['logoUrl'];
    priceTrx = (json['priceTrx'] as num)?.toDouble();
    priceUsd = (json['priceUsd'] as num)?.toDouble();
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
    data['priceUsd'] = this.priceUsd;
    return data;
  }
}
