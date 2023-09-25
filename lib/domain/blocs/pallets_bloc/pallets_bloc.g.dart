// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pallets_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PalletsStateLoading _$$PalletsStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$PalletsStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PalletsStateLoadingToJson(
        _$PalletsStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PalletsStateLoaded _$$PalletsStateLoadedFromJson(Map<String, dynamic> json) =>
    _$PalletsStateLoaded(
      listPallets:
          ListPallets.fromJson(json['listPallets'] as Map<String, dynamic>),
      units: (json['units'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      allBarcodeHistory: (json['allBarcodeHistory'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      countBarcodes: json['countBarcodes'] as int,
      maxIndexUnitInBox: json['maxIndexUnitInBox'] as int,
      countBox: json['countBox'] as int,
      currentTypeBarcode: $enumDecodeNullable(
          _$TypeOfBarcodeEnumMap, json['currentTypeBarcode']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PalletsStateLoadedToJson(
        _$PalletsStateLoaded instance) =>
    <String, dynamic>{
      'listPallets': instance.listPallets,
      'units': instance.units,
      'allBarcodeHistory': instance.allBarcodeHistory.toList(),
      'countBarcodes': instance.countBarcodes,
      'maxIndexUnitInBox': instance.maxIndexUnitInBox,
      'countBox': instance.countBox,
      'currentTypeBarcode': _$TypeOfBarcodeEnumMap[instance.currentTypeBarcode],
      'runtimeType': instance.$type,
    };

const _$TypeOfBarcodeEnumMap = {
  TypeOfBarcode.unit: 'unit',
  TypeOfBarcode.box: 'box',
  TypeOfBarcode.pallet: 'pallet',
  TypeOfBarcode.undefined: 'undefined',
};

_$PalletsStateError _$$PalletsStateErrorFromJson(Map<String, dynamic> json) =>
    _$PalletsStateError(
      errorText: json['errorText'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PalletsStateErrorToJson(_$PalletsStateError instance) =>
    <String, dynamic>{
      'errorText': instance.errorText,
      'runtimeType': instance.$type,
    };
