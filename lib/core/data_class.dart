import 'package:flutter/material.dart';
import 'package:vector_space_model/service/api_service.dart';

import '../model/data_model.dart';

class DataClass extends ChangeNotifier{
  List<DataModel>? data;
  getData({required String query, required BuildContext context}) async {
    data = (await getDataResult(query: query, context: context))!;
    notifyListeners();
  }
}