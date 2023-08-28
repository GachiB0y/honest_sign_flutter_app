// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final modelsPallet = modelsPalletFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

ModelsPallet modelsPalletFromJson(String str) =>
    ModelsPallet.fromJson(json.decode(str));

String modelsPalletToJson(ModelsPallet data) => json.encode(data.toJson());

class ListPallets {
  List<ModelsPallet> listPallets;
  ListPallets({
    required this.listPallets,
  });

  ListPallets copyWith({
    List<ModelsPallet>? listPallets,
  }) {
    return ListPallets(
      listPallets: listPallets ?? this.listPallets,
    );
  }

  factory ListPallets.fromJson(Map<String, dynamic> json) => ListPallets(
        listPallets: List<ModelsPallet>.from(
            json["listPallets"].map((x) => ModelsPallet.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listPallets": List<dynamic>.from(listPallets.map((x) => x.toJson())),
      };

  @override
  String toString() => 'ListPallets(listPallets: $listPallets)';

  @override
  bool operator ==(covariant ListPallets other) {
    if (identical(this, other)) return true;

    return listEquals(other.listPallets, listPallets);
  }

  @override
  int get hashCode => listPallets.hashCode;
}

class ModelsPallet {
  String barcode;
  String date;
  String dateRelease;
  String status;

  List<Box> boxes;

  ModelsPallet({
    required this.barcode,
    required this.date,
    required this.dateRelease,
    required this.status,
    required this.boxes,
  });

  factory ModelsPallet.fromJson(Map<String, dynamic> json) => ModelsPallet(
        barcode: json["barcode"],
        date: json["date"],
        dateRelease: json["dateRelease"],
        status: json["status"],
        boxes: List<Box>.from(json["boxes"].map((x) => Box.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "barcode": barcode,
        "date": date,
        "dateRelease": dateRelease,
        "status": status,
        "boxes": List<dynamic>.from(boxes.map((x) => x.toJson())),
      };

  ModelsPallet copyWith({
    String? barcode,
    String? date,
    String? dateRelease,
    String? status,
    List<Box>? boxes,
  }) {
    return ModelsPallet(
      barcode: barcode ?? this.barcode,
      date: date ?? this.date,
      dateRelease: dateRelease ?? this.dateRelease,
      status: status ?? this.status,
      boxes: boxes ?? this.boxes,
    );
  }
}

class Box {
  String barcode;
  String date;

  List<Item> items;

  Box({
    required this.barcode,
    required this.date,
    required this.items,
  });

  factory Box.fromJson(Map<String, dynamic> json) => Box(
        barcode: json["barcode"],
        date: json["date"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "barcode": barcode,
        "date": date,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String barcode;
  String date;

  Item({
    required this.barcode,
    required this.date,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        barcode: json["barcode"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "barcode": barcode,
        "date": date,
      };
}
