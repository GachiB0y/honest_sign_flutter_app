// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_view_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainViewModelStateInit _$$MainViewModelStateInitFromJson(
        Map<String, dynamic> json) =>
    _$MainViewModelStateInit(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MainViewModelStateInitToJson(
        _$MainViewModelStateInit instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MainViewModelStateLoaded _$$MainViewModelStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$MainViewModelStateLoaded(
      currentTypeBarcode: $enumDecodeNullable(
          _$TypeOfBarcodeEnumMap, json['currentTypeBarcode']),
      isDublicate: json['isDublicate'] as bool?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MainViewModelStateLoadedToJson(
        _$MainViewModelStateLoaded instance) =>
    <String, dynamic>{
      'currentTypeBarcode': _$TypeOfBarcodeEnumMap[instance.currentTypeBarcode],
      'isDublicate': instance.isDublicate,
      'runtimeType': instance.$type,
    };

const _$TypeOfBarcodeEnumMap = {
  TypeOfBarcode.unit: 'unit',
  TypeOfBarcode.box: 'box',
  TypeOfBarcode.pallet: 'pallet',
  TypeOfBarcode.undefined: 'undefined',
};

_$MainViewModelStateError _$$MainViewModelStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$MainViewModelStateError(
      errorText: json['errorText'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MainViewModelStateErrorToJson(
        _$MainViewModelStateError instance) =>
    <String, dynamic>{
      'errorText': instance.errorText,
      'runtimeType': instance.$type,
    };
