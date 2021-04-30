
class Model {
  String modelName;
  int price;
  bool gasoline;

  Model({this.modelName, this.price, this.gasoline});

  Model.fromJson(Map<String, dynamic> json) {
    modelName = json['model_name'];
    price = json['price'];
    gasoline = json['gasoline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_name'] = this.modelName;
    data['price'] = this.price;
    data['gasoline'] = this.gasoline;
    return data;
  }
}