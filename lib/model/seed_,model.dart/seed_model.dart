
class SeedModel {
  String? _type;
  String? _message;
  List<SeedData>? _data;

  SeedModel({String? type, String? message, List<SeedData>? data}) {
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
  List<SeedData>? get data => _data;
  set data(List<SeedData>? data) => _data = data;

  SeedModel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <SeedData>[];
      json['data'].forEach((v) {
        _data!.add(new SeedData.fromJson(v));
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

class SeedData {
  String? _seedId;
  String? _name;
  String? _description;
  String? _imageUrl;

  SeedData({String? seedId, String? name, String? description, String? imageUrl}) {
    if (seedId != null) {
      this._seedId = seedId;
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
  }

  String? get seedId => _seedId;
  set seedId(String? seedId) => _seedId = seedId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  SeedData.fromJson(Map<String, dynamic> json) {
    _seedId = json['seedId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seedId'] = this._seedId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['imageUrl'] = this._imageUrl;
    return data;
  }
}




