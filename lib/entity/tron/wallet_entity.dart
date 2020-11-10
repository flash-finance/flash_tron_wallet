class WalletEntity {

  String name;

  String pwd;

  String mnemonic;

  String privateKey;

  String tronAddress;

  WalletEntity({this.name, this.pwd, this.mnemonic, this.privateKey, this.tronAddress});

  WalletEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pwd = json['pwd'];
    mnemonic = json['mnemonic'];
    privateKey = json['privateKey'];
    tronAddress = json['tronAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pwd'] = this.pwd;
    data['mnemonic'] = this.mnemonic;
    data['privateKey'] = this.privateKey;
    data['tronAddress'] = this.tronAddress;
    return data;
  }
}
