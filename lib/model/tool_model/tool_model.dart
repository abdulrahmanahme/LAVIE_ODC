
class ToolsModel {
  String? _type;
  String? _message;
  List<ToolsData >? _data;

  ToolsModel({String? type, String? message, List<ToolsData >? data}) {
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
  List<ToolsData >? get data => _data;
  set data(List<ToolsData >? data) => _data = data;

  ToolsModel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <ToolsData >[];
      json['data'].forEach((v) {
        _data!.add(new ToolsData .fromJson(v));
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

class ToolsData {
  String? _toolId;
  String? _name;
  String? _description;
  String? _imageUrl;

  ToolsData ({String? toolId, String? name, String? description, String? imageUrl}) {
    if (toolId != null) {
      this._toolId = toolId;
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

  String? get toolId => _toolId;
  set toolId(String? toolId) => _toolId = toolId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  ToolsData .fromJson(Map<String, dynamic> json) {
    _toolId = json['toolId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toolId'] = this._toolId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['imageUrl'] = this._imageUrl;
    return data;
  }
}