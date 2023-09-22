// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListPallets _$$_ListPalletsFromJson(Map<String, dynamic> json) =>
    _$_ListPallets(
      listPallets: (json['listPallets'] as List<dynamic>)
          .map((e) => ModelsPallet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListPalletsToJson(_$_ListPallets instance) =>
    <String, dynamic>{
      'listPallets': instance.listPallets,
    };

_$_ModelsPallet _$$_ModelsPalletFromJson(Map<String, dynamic> json) =>
    _$_ModelsPallet(
      barcode: json['barcode'] as String,
      date: json['date'] as String,
      dateRelease: json['dateRelease'] as String,
      status: json['status'] as String,
      boxes: (json['boxes'] as List<dynamic>)
          .map((e) => Box.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ModelsPalletToJson(_$_ModelsPallet instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'date': instance.date,
      'dateRelease': instance.dateRelease,
      'status': instance.status,
      'boxes': instance.boxes,
    };

_$_Box _$$_BoxFromJson(Map<String, dynamic> json) => _$_Box(
      barcode: json['barcode'] as String,
      date: json['date'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BoxToJson(_$_Box instance) => <String, dynamic>{
      'barcode': instance.barcode,
      'date': instance.date,
      'items': instance.items,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      barcode: json['barcode'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'barcode': instance.barcode,
      'date': instance.date,
    };
