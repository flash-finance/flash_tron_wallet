class AssetEntity {
  int type;

  String address;

  String name;

  int precision;

  double balance;

  double usd;

  String logoUrl;

  String originBalance;

  AssetEntity(
      {this.type,
      this.address,
      this.name,
      this.precision,
      this.balance,
      this.usd,
      this.logoUrl,
      this.originBalance});

  AssetEntity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    address = json['address'];
    name = json['name'];
    balance = json['balance'];
    usd = json['usd'];
    logoUrl = json['logoUrl'];
    originBalance = json['originBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['address'] = this.address;
    data['name'] = this.name;
    data['balance'] = this.balance;
    data['cny'] = this.usd;
    data['logoUrl'] = this.logoUrl;
    data['originBalance'] = this.originBalance;
    return data;
  }
}
