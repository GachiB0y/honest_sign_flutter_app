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

_$PalletsStateCloseApp _$$PalletsStateCloseAppFromJson(
        Map<String, dynamic> json) =>
    _$PalletsStateCloseApp(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PalletsStateCloseAppToJson(
        _$PalletsStateCloseApp instance) =>
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
      currentBarcodeHistory: (json['currentBarcodeHistory'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      countBarcodes: json['countBarcodes'] as int,
      maxIndexUnitInBox: json['maxIndexUnitInBox'] as int,
      countBox: json['countBox'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PalletsStateLoadedToJson(
        _$PalletsStateLoaded instance) =>
    <String, dynamic>{
      'listPallets': instance.listPallets,
      'units': instance.units,
      'allBarcodeHistory': instance.allBarcodeHistory.toList(),
      'currentBarcodeHistory': instance.currentBarcodeHistory.toList(),
      'countBarcodes': instance.countBarcodes,
      'maxIndexUnitInBox': instance.maxIndexUnitInBox,
      'countBox': instance.countBox,
      'runtimeType': instance.$type,
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
