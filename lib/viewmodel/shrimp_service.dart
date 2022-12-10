import 'package:dio/dio.dart';

import '../model/Shrimps.dart';

import '../model/User.dart';

class shrimpservice {
  final String baseUrlApi = "http://192.168.0.123:3000";

  Future<List<ShrimpModel>> fetchDataShrimp() async {
    Response response = await Dio().get("$baseUrlApi/shrimps");
    List<ShrimpModel> shrimps =
        (response.data as List).map((v) => ShrimpModel.fromJSON(v)).toList();
    return shrimps;
  }
}
