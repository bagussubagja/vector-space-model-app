import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vector_space_model/model/data_model.dart';

Future<List<DataModel>> getDataResult({required String query}) async {
  var client = http.Client();
  var uri = Uri.parse(
      'http://cp4g21.deta.dev/search?query=${query.replaceAll(" ", "+")}');
  try {
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return dataModelFromJson(json);
    } else if (response.statusCode == 404) {
      throw jsonDecode(response.body)["messages"];
    } else {
      throw response.body;
    }
  } catch (e) {
    throw "Terjadi kesalahan pada server";
  }
}
