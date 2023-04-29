import 'dart:convert';

import '../constants.dart';
import '../models/rocket_model.dart';
import 'package:http/http.dart' as http;

//this class is created for calling api using http package
class RemoteServices {
  static Future<List<RocketModel>> fetchRockets() async {
    var response = await http.get(Uri.parse(baseUrl));
    //check http status
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => RocketModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load Rockets');
    } //if else end for checking status code
  }
}
