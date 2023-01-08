import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);

      return decodeData;
      // print(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
