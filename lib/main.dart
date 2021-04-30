import 'package:flutter/material.dart';
import 'package:http_json_api/local_json.dart';
import 'package:http_json_api/remote_api.dart';

void main() {
  runApp(MaterialApp(
    home: RemoteApi(),
    debugShowCheckedModeBanner: false,
  ));
}
