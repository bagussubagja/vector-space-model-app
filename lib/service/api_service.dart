import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vector_space_model/model/data_model.dart';

Future<List<DataModel>?> getDataResult(
    {required String query}) async {
  var client = http.Client();
  var uri = Uri.parse('https://cp4g21.deta.dev/search?query=${query.replaceAll(" ", "+")}');
  print("query : $query");
  var respone = await client.get(uri);
  if (respone.statusCode == 200) {
    var json = respone.body;
    print('json $json');
    return dataModelFromJson(json);
  }
}