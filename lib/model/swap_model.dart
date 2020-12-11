class SwapRespModel {
  int code;
  String msg;
  SwapData data;

  SwapRespModel({this.code, this.msg, this.data});

  SwapRespModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new SwapData.fromJson(json['data']) : null;
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

class SwapData {
  int total;
  List<SwapRow> rows;

  SwapData({this.total, this.rows});

  SwapData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['rows'] != null) {
      rows = new List<SwapRow>();
      json['rows'].forEach((v) {
        rows.add(new SwapRow.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SwapRow {
  int id;
  String lpTokenAddress;
  String swapTokenAddress;
  String swapTokenName;
  int swapTokenType;
  int swapTokenPrecision;
  String swapPicUrl;
  String swapPairName;
  String swapPairAddress;
  String baseTokenAddress;
  String baseTokenName;
  int baseTokenType;
  int baseTokenPrecision;
  String basePicUrl;
  double swapTokenAmount;
  double baseTokenAmount;
  double totalLiquidity;
  double swapTokenPrice1;
  double swapTokenPrice2;
  double baseTokenPrice1;
  double baseTokenPrice2;
  double volume24h;
  double transaction24h;

  SwapRow(
      {this.id,
        this.lpTokenAddress,
        this.swapTokenAddress,
        this.swapTokenName,
        this.swapTokenType,
        this.swapTokenPrecision,
        this.swapPicUrl,
        this.swapPairName,
        this.swapPairAddress,
        this.baseTokenAddress,
        this.baseTokenName,
        this.baseTokenType,
        this.baseTokenPrecision,
        this.basePicUrl,
        this.swapTokenAmount,
        this.baseTokenAmount,
        this.totalLiquidity,
        this.swapTokenPrice1,
        this.swapTokenPrice2,
        this.baseTokenPrice1,
        this.baseTokenPrice2,
        this.volume24h,
        this.transaction24h,
      });

  SwapRow.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lpTokenAddress = json['lpTokenAddress'];
    swapTokenAddress = json['swapTokenAddress'];
    swapTokenName = json['swapTokenName'];
    swapTokenType = json['swapTokenType'];
    swapTokenPrecision = json['swapTokenPrecision'];
    swapPicUrl = json['swapPicUrl'];
    swapPairName = json['swapPairName'];
    swapPairAddress = json['swapPairAddress'];
    baseTokenAddress = json['baseTokenAddress'];
    baseTokenName = json['baseTokenName'];
    baseTokenType = json['baseTokenType'];
    baseTokenPrecision = json['baseTokenPrecision'];
    basePicUrl = json['basePicUrl'];
    swapTokenAmount = (json['swapTokenAmount'] as num)?.toDouble();
    baseTokenAmount = (json['baseTokenAmount'] as num)?.toDouble();
    totalLiquidity = (json['totalLiquidity'] as num)?.toDouble();
    swapTokenPrice1 = (json['swapTokenPrice1'] as num)?.toDouble();
    swapTokenPrice2 = (json['swapTokenPrice2'] as num)?.toDouble();
    baseTokenPrice1 = (json['baseTokenPrice1'] as num)?.toDouble();
    baseTokenPrice2 = (json['baseTokenPrice2'] as num)?.toDouble();
    volume24h = (json['volume24h'] as num)?.toDouble();
    transaction24h = (json['transaction24h'] as num)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lpTokenAddress'] = this.lpTokenAddress;
    data['swapTokenAddress'] = this.swapTokenAddress;
    data['swapTokenName'] = this.swapTokenName;
    data['swapTokenType'] = this.swapTokenType;
    data['swapTokenPrecision'] = this.swapTokenPrecision;
    data['swapPicUrl'] = this.swapPicUrl;
    data['swapPairName'] = this.swapPairName;
    data['swapPairAddress'] = this.swapPairAddress;
    data['baseTokenAddress'] = this.baseTokenAddress;
    data['baseTokenName'] = this.baseTokenName;
    data['baseTokenType'] = this.baseTokenType;
    data['baseTokenPrecision'] = this.baseTokenPrecision;
    data['basePicUrl'] = this.basePicUrl;
    data['swapTokenAmount'] = this.swapTokenAmount;
    data['baseTokenAmount'] = this.baseTokenAmount;
    data['totalLiquidity'] = this.totalLiquidity;
    data['swapTokenPrice1'] = this.swapTokenPrice1;
    data['swapTokenPrice2'] = this.swapTokenPrice2;
    data['baseTokenPrice1'] = this.baseTokenPrice1;
    data['baseTokenPrice2'] = this.baseTokenPrice2;
    data['volume24h'] = this.volume24h;
    data['transaction24h'] = this.transaction24h;
    return data;
  }
}
