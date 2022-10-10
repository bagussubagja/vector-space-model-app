// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  DataModel({
    required this.documentId,
    required this.corpus,
    required this.scores,
  });

  int documentId;
  String corpus;
  double scores;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    documentId: json["document_id"],
    corpus: json["corpus"],
    scores: json["scores"],
  );

  Map<String, dynamic> toJson() => {
    "document_id": documentId,
    "corpus": corpus,
    "scores": scores,
  };
}
