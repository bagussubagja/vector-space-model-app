import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vector_space_model/model/data_model.dart';

Future<List<DataModel>?> getDataResult(
    {required String query, required BuildContext context}) async {
  var client = http.Client();
  var uri = Uri.parse(
      'http://cp4g21.deta.dev/search?query=${query.replaceAll(" ", "+")}');
  try {
    var respone = await client.get(uri);
    if (respone.statusCode == 200) {
      var json = respone.body;
      return dataModelFromJson(json);
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
  return [];
}
