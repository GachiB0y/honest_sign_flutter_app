import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_entity.freezed.dart';
part 'new_entity.g.dart';

@freezed
class ListPallets with _$ListPallets {
  const factory ListPallets({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'listPallets') required List<ModelsPallet> listModelsPallet,
  }) = _ListPallets;

  factory ListPallets.fromJson(Map<String, dynamic> json) =>
      _$ListPalletsFromJson(json);
}

@freezed
class ModelsPallet with _$ModelsPallet {
  const factory ModelsPallet({
    required String barcode,
    required String? barcodeParty,
    required String date,
    required String dateRelease,
    required String status,
    required List<Box> boxes,
  }) = _ModelsPallet;

  factory ModelsPallet.fromJson(Map<String, dynamic> json) =>
      _$ModelsPalletFromJson(json);
}

@freezed
class Box with _$Box {
  const factory Box({
    required String barcode,
    required String date,
    required List<Item> items,
  }) = _Box;

  factory Box.fromJson(Map<String, dynamic> json) => _$BoxFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String barcode,
    required String date,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
