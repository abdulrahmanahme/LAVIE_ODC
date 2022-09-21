
class MYDataModel {
  String? _type;
  String? _message;
  Data? _data;

  MYDataModel({String? type, String? message, Data? data}) {
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

  MYDataModel.fromJson(Map<String, dynamic> json) {
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
  String? _userId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _imageUrl;
  String? _address;
  String? _role;

  Data(
      {String? userId,
      String? firstName,
      String? lastName,
      String? email,
      String? imageUrl,
      String? address,
      String? role}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (email != null) {
      this._email = email;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
    if (address != null) {
      this._address = address;
    }
    if (role != null) {
      this._role = role;
    }
  }

  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get role => _role;
  set role(String? role) => _role = role;

  Data.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _imageUrl = json['imageUrl'];
    _address = json['address'];
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['email'] = this._email;
    data['imageUrl'] = this._imageUrl;
    data['address'] = this._address;
    data['role'] = this._role;
    return data;
  }
}