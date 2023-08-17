// To parse this JSON data, do
//
//     final modelsPallet = modelsPalletFromJson(jsonString);

import 'dart:convert';

ModelsPallet modelsPalletFromJson(String str) =>
    ModelsPallet.fromJson(json.decode(str));

String modelsPalletToJson(ModelsPallet data) => json.encode(data.toJson());

class ModelsPallet {
  String barcode;
  String date;
  String dateRelease;

  List<Box> boxes;

  ModelsPallet({
    required this.barcode,
    required this.date,
    required this.dateRelease,
    required this.boxes,
  });

  factory ModelsPallet.fromJson(Map<String, dynamic> json) => ModelsPallet(
        barcode: json["barcode"],
        date: json["date"],
        dateRelease: json["dateRelease"],
        boxes: List<Box>.from(json["boxes"].map((x) => Box.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "barcode": barcode,
        "date": date,
        "dateRelease": dateRelease,
        "boxes": List<dynamic>.from(boxes.map((x) => x.toJson())),
      };
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
