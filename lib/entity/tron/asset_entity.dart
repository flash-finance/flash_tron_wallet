class AssetEntity {

  int type;

  String address;

  String name;

  int precision;

  double balance;

  double frozen;

  double order;

  double cny;

  String logoUrl;

  AssetEntity({this.type, this.address, this.name, this.precision, this.balance, this.frozen, this.order, this.cny, this.logoUrl});

  AssetEntity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    address = json['address'];
    name = json['name'];
    balance = json['balance'];
    frozen = json['frozen'];
    order = json['order'];
    cny = json['cny'];
    logoUrl = json['logoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['address'] = this.address;
    data['name'] = this.name;
    data['balance'] = this.balance;
    data['frozen'] = this.frozen;
    data['order'] = this.order;
    data['cny'] = this.cny;
    data['logoUrl'] = this.logoUrl;
    return data;
  }

}