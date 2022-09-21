
class PostModel {
  String? _type;
  String? _message;
  Data? _data;

  PostModel({String? type, String? message, Data? data}) {
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
  Data? get data => _data;
  set data(Data? data) => _data = data;

  PostModel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  String? _forumId;
  String? _title;
  String? _description;
  String? _imageUrl;
  String? _userId;

  Data(
      {String? forumId,
      String? title,
      String? description,
      String? imageUrl,
      String? userId}) {
    if (forumId != null) {
      this._forumId = forumId;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
    if (userId != null) {
      this._userId = userId;
    }
  }

  String? get forumId => _forumId;
  set forumId(String? forumId) => _forumId = forumId;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;

  Data.fromJson(Map<String, dynamic> json) {
    _forumId = json['forumId'];
    _title = json['title'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forumId'] = this._forumId;
    data['title'] = this._title;
    data['description'] = this._description;
    data['imageUrl'] = this._imageUrl;
    data['userId'] = this._userId;
    return data;
  }
}