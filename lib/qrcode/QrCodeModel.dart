// To parse this JSON data, do
//
//     final presenceModel = presenceModelFromJson(jsonString);

import 'dart:convert';

QrCodeModel presenceModelFromJson(String str) =>
    QrCodeModel.fromJson(json.decode(str));

String presenceModelToJson(QrCodeModel data) => json.encode(data.toJson());

class QrCodeModel {
  DateTime? created_at;

  QrCodeModel({
    this.created_at,
  });

  factory QrCodeModel.fromJson(Map<String, dynamic> json) => QrCodeModel(
        created_at: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "date": created_at?.toIso8601String(),
      };
}
