import 'model.dart';

class Car {
  String carName;
  String country;
  String year;
  List<Model> model;

  Car({this.carName, this.country, this.year, this.model});

  Car.fromJson(Map<String, dynamic> json) {
      carName = json['car_name'];
      country = json['country'];
      year = json['year'];
      if (json['model'] != null) {
      model = <Model>[];
      json['model'].forEach((v) {
        model.add(new Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_name'] = this.carName;
    data['country'] = this.country;
    data['year'] = this.year;
    if (this.model != null) {
      data['model'] = this.model.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
