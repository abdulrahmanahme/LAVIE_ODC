
class PlantsModel {
  String? _type;
  String? _message;
  List<PlantsData>? _data;

  PlantsModel({String? type, String? message, List<PlantsData>? data}) {
    if (type != null) {
      this._type = type;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<PlantsData>? get data => _data;
  set data(List<PlantsData>? data) => _data = data;

  PlantsModel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <PlantsData>[];
      json['data'].forEach((v) {
        _data!.add(new PlantsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlantsData {
  String? _plantId;
  String? _name;
  String? _description;
  String? _imageUrl;
  int? _waterCapacity;
  int? _sunLight;
  int? _temperature;

  PlantsData(
      {String? plantId,
      String? name,
      String? description,
      String? imageUrl,
      int? waterCapacity,
      int? sunLight,
      int? temperature}) {
    if (plantId != null) {
      this._plantId = plantId;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
    if (waterCapacity != null) {
      this._waterCapacity = waterCapacity;
    }
    if (sunLight != null) {
      this._sunLight = sunLight;
    }
    if (temperature != null) {
      this._temperature = temperature;
    }
  }

  String? get plantId => _plantId;
  set plantId(String? plantId) => _plantId = plantId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
  int? get waterCapacity => _waterCapacity;
  set waterCapacity(int? waterCapacity) => _waterCapacity = waterCapacity;
  int? get sunLight => _sunLight;
  set sunLight(int? sunLight) => _sunLight = sunLight;
  int? get temperature => _temperature;
  set temperature(int? temperature) => _temperature = temperature;

  PlantsData.fromJson(Map<String, dynamic> json) {
    _plantId = json['plantId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _waterCapacity = json['waterCapacity'];
    _sunLight = json['sunLight'];
    _temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plantId'] = this._plantId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['imageUrl'] = this._imageUrl;
    data['waterCapacity'] = this._waterCapacity;
    data['sunLight'] = this._sunLight;
    data['temperature'] = this._temperature;
    return data;
  }
}