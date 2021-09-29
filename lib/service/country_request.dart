import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryRequest {
  static Future<List> exec() async {
    Map countries = {};
    Uri apiUrl = Uri.parse('http://api.nobelprize.org/v1/country.json');

    http.Response response = await http.get(apiUrl);
    debugPrint("Result: ${response.body}");

    if (response.statusCode == 200) {
      countries = json.decode(response.body);

      return countries.values.first;
    } else {
      throw Exception("Request failed");
    }
  } 
}