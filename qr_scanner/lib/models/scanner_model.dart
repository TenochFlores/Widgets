// To parse this JSON data, do
//
//     final scannerModel = scannerModelFromJson(jsonString);

import 'dart:convert';

ScannerModel scannerModelFromJson(String str) => ScannerModel.fromJson(json.decode(str));

String scannerModelToJson(ScannerModel data) => json.encode(data.toJson());

class ScannerModel {
    ScannerModel({
      this.id,
      this.tipo,
      required this.valor,
    }) {
      if( valor.contains('http') ) {
        tipo = 'http';
      } else {
        tipo = 'geo';
      }
    }

    int? id;
    String? tipo;
    String valor;

    factory ScannerModel.fromJson(Map<String, dynamic> json) => ScannerModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
