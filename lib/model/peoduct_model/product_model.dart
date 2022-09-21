
// class ProductModel {
//   String? message;
//   List<ProductData> data = [];
//   ProductModel();
//   ProductModel.fromJson(Map<String, dynamic> json) {
//     message = json["message"];
//     json["data"].forEach((element) {
//       data.add(ProductData.fromJson(element));
//     });
//   }
// }

// class ProductData {
//   late String productId;
//   late String name;
//   late String description;
//   late String imageUrl;
//   late String type;
//   late int price;

//   ProductData.fromJson(Map<String, dynamic> json) {
//     productId = json["productId"];
//     name = json["name"];
//     description = json["description"];
//     imageUrl = json["imageUrl"];
//     type = json["type"];
//     price = json["price"];
//   }
// }

class ProductsModel {
  String? _type;
  String? _message;
  List<DataProduct>? _data;

  ProductsModel({String? type, String? message, List<DataProduct>? data}) {
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
  List<DataProduct>? get data => _data;
  set data(List<DataProduct>? data) => _data = data;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <DataProduct>[];
      json['data'].forEach((v) {
        _data!.add(new DataProduct.fromJson(v));
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


class DataProduct {
  String? _productId;
  String? _name;
  String? _description;
  String? _imageUrl;
  String? _type;
  int? _price;
  bool? _available;
  Seed? _seed;
  Plant? _plant;
  Tool? _tool;

  DataProduct(
      {String? productId,
      String? name,
      String? description,
      String? imageUrl,
      String? type,
      int? price,
      bool? available,
      Seed? seed,
      Plant? plant,
      Tool? tool}) {
    if (productId != null) {
      this._productId = productId;
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
    if (type != null) {
      this._type = type;
    }
    if (price != null) {
      this._price = price;
    }
    if (available != null) {
      this._available = available;
    }
    if (seed != null) {
      this._seed = seed;
    }
    if (plant != null) {
      this._plant = plant;
    }
    if (tool != null) {
      this._tool = tool;
    }
  }

  String? get productId => _productId;
  set productId(String? productId) => _productId = productId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
  String? get type => _type;
  set type(String? type) => _type = type;
  int? get price => _price;
  set price(int? price) => _price = price;
  bool? get available => _available;
  set available(bool? available) => _available = available;
  Seed? get seed => _seed;
  set seed(Seed? seed) => _seed = seed;
  Plant? get plant => _plant;
  set plant(Plant? plant) => _plant = plant;
  Tool? get tool => _tool;
  set tool(Tool? tool) => _tool = tool;

  DataProduct.fromJson(Map<String, dynamic> json) {
    _productId = json['productId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _type = json['type'];
    _price = json['price'];
    _available = json['available'];
    _seed = json['seed'] != null ? new Seed.fromJson(json['seed']) : null;
    _plant = json['plant'] != null ? new Plant.fromJson(json['plant']) : null;
    _tool = json['tool'] != null ? new Tool.fromJson(json['tool']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this._productId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['imageUrl'] = this._imageUrl;
    data['type'] = this._type;
    data['price'] = this._price;
    data['available'] = this._available;
    if (this._seed != null) {
      data['seed'] = this._seed!.toJson();
    }
    if (this._plant != null) {
      data['plant'] = this._plant!.toJson();
    }
    if (this._tool != null) {
      data['tool'] = this._tool!.toJson();
    }
    return data;
  }
}

class Seed {
  String? _seedId;
  String? _name;
  String? _description;
  String? _imageUrl;

  Seed({String? seedId, String? name, String? description, String? imageUrl}) {
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

  Seed.fromJson(Map<String, dynamic> json) {
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

class Plant {
  String? _plantId;
  String? _name;
  String? _description;
  String? _imageUrl;
  int? _waterCapacity;
  int? _sunLight;
  int? _temperature;

  Plant(
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

  Plant.fromJson(Map<String, dynamic> json) {
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

class Tool {
  String? _toolId;
  String? _name;
  String? _description;
  String? _imageUrl;

  Tool({String? toolId, String? name, String? description, String? imageUrl}) {
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

  Tool.fromJson(Map<String, dynamic> json) {
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