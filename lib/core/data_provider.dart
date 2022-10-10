import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vector_space_model/service/api_service.dart';

import '../model/data_model.dart';

class DataProvider extends ChangeNotifier{

  List<DataModel> data = [];
  bool isLoading = false;
  String messages = "";
  String query = "";


  getData({required String query}) async {
    this.query = query;
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      data = [];
      data = await getDataResult(query: query);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      messages = "$e";
      isLoading = false;
      notifyListeners();
    }

  }
}