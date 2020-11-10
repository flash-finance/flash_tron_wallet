class AbiEntity {
  List<Entrys> entrys;

  AbiEntity({this.entrys});

  AbiEntity.fromJson(Map<String, dynamic> json) {
    if (json['entrys'] != null) {
      entrys = new List<Entrys>();
      json['entrys'].forEach((v) {
        entrys.add(new Entrys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entrys != null) {
      data['entrys'] = this.entrys.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entrys {
  String name;
  List<Inputs> inputs;
  List<Outputs> outputs;
  String type;
  String stateMutability;
  bool constant;

  Entrys(
      {this.name,
        this.inputs,
        this.outputs,
        this.type,
        this.stateMutability,
        this.constant});

  Entrys.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['inputs'] != null) {
      inputs = new List<Inputs>();
      json['inputs'].forEach((v) {
        inputs.add(new Inputs.fromJson(v));
      });
    }
    if (json['outputs'] != null) {
      outputs = new List<Outputs>();
      json['outputs'].forEach((v) {
        outputs.add(new Outputs.fromJson(v));
      });
    }
    type = json['type'];
    stateMutability = json['stateMutability'];
    constant = json['constant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.inputs != null) {
      data['inputs'] = this.inputs.map((v) => v.toJson()).toList();
    }
    if (this.outputs != null) {
      data['outputs'] = this.outputs.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    data['stateMutability'] = this.stateMutability;
    data['constant'] = this.constant;
    return data;
  }
}

class Inputs {
  String name;
  String type;
  bool indexed;

  Inputs({this.name, this.type, this.indexed});

  Inputs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    indexed = json['indexed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['indexed'] = this.indexed;
    return data;
  }
}

class Outputs {
  String type;

  Outputs({this.type});

  Outputs.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}
