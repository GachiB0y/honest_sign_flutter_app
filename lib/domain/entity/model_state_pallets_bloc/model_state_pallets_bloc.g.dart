// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_state_pallets_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModelStatePalletsBloc _$$_ModelStatePalletsBlocFromJson(
        Map<String, dynamic> json) =>
    _$_ModelStatePalletsBloc(
      listPallets:
          ListPallets.fromJson(json['listPallets'] as Map<String, dynamic>),
      units: (json['units'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      allBarcodeHistory: (json['allBarcodeHistory'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      currentBarcodeHistory: (json['currentBarcodeHistory'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      countBarcodes: json['countBarcodes'] as int,
      maxIndexUnitInBox: json['maxIndexUnitInBox'] as int,
      countBox: json['countBox'] as int,
      isLoading: json['isLoading'] as bool?,
      errorText: json['errorText'] as String?,
      isNewRelease: json['isNewRelease'] as bool?,
      gtin: json['gtin'] as String?,
    );

Map<String, dynamic> _$$_ModelStatePalletsBlocToJson(
        _$_ModelStatePalletsBloc instance) =>
    <String, dynamic>{
      'listPallets': instance.listPallets,
      'units': instance.units,
      'allBarcodeHistory': instance.allBarcodeHistory.toList(),
      'currentBarcodeHistory': instance.currentBarcodeHistory.toList(),
      'countBarcodes': instance.countBarcodes,
      'maxIndexUnitInBox': instance.maxIndexUnitInBox,
      'countBox': instance.countBox,
      'isLoading': instance.isLoading,
      'errorText': instance.errorText,
      'isNewRelease': instance.isNewRelease,
      'gtin': instance.gtin,
    };
