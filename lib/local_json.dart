import 'package:flutter/material.dart';
import 'dart:convert';

import 'models/car.dart';

class LocalJson extends StatefulWidget {
  @override
  _LocalJsonState createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  List<Car> carList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Local Json"),
        ),
        body: Center(
          child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  carList = snapshot.data;
                  return ListView.builder(
                      itemCount: carList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(carList[index].carName),
                          subtitle: Text(carList[index].country),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }

  Future<List<Car>> fetchData() async {
    // to read the json file from locale
    var dataJson =
        await DefaultAssetBundle.of(context).loadString("assets/data/car.json");

    // make the list of cars by using fromJson method
    List<Car> carList = (json.decode(dataJson) as List).map((mapData) {
      return Car.fromJson(mapData);
    }).toList();

    print('the numbers of the total car ' + carList.length.toString());

    return carList;
  }
}
