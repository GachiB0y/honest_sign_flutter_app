// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pallets_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PalletsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PalletsEventCopyWith<$Res> {
  factory $PalletsEventCopyWith(
          PalletsEvent value, $Res Function(PalletsEvent) then) =
      _$PalletsEventCopyWithImpl<$Res, PalletsEvent>;
}

/// @nodoc
class _$PalletsEventCopyWithImpl<$Res, $Val extends PalletsEvent>
    implements $PalletsEventCopyWith<$Res> {
  _$PalletsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PalletsEventFetchCopyWith<$Res> {
  factory _$$PalletsEventFetchCopyWith(
          _$PalletsEventFetch value, $Res Function(_$PalletsEventFetch) then) =
      __$$PalletsEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PalletsEventFetchCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res, _$PalletsEventFetch>
    implements _$$PalletsEventFetchCopyWith<$Res> {
  __$$PalletsEventFetchCopyWithImpl(
      _$PalletsEventFetch _value, $Res Function(_$PalletsEventFetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PalletsEventFetch implements PalletsEventFetch {
  const _$PalletsEventFetch();

  @override
  String toString() {
    return 'PalletsEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PalletsEventFetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class PalletsEventFetch implements PalletsEvent {
  const factory PalletsEventFetch() = _$PalletsEventFetch;
}

/// @nodoc
abstract class _$$PalletsEventSendBarcodesCopyWith<$Res> {
  factory _$$PalletsEventSendBarcodesCopyWith(_$PalletsEventSendBarcodes value,
          $Res Function(_$PalletsEventSendBarcodes) then) =
      __$$PalletsEventSendBarcodesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PalletsEventSendBarcodesCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res, _$PalletsEventSendBarcodes>
    implements _$$PalletsEventSendBarcodesCopyWith<$Res> {
  __$$PalletsEventSendBarcodesCopyWithImpl(_$PalletsEventSendBarcodes _value,
      $Res Function(_$PalletsEventSendBarcodes) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PalletsEventSendBarcodes implements PalletsEventSendBarcodes {
  const _$PalletsEventSendBarcodes();

  @override
  String toString() {
    return 'PalletsEvent.sendBarcodes()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventSendBarcodes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return sendBarcodes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return sendBarcodes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (sendBarcodes != null) {
      return sendBarcodes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return sendBarcodes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return sendBarcodes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (sendBarcodes != null) {
      return sendBarcodes(this);
    }
    return orElse();
  }
}

abstract class PalletsEventSendBarcodes implements PalletsEvent {
  const factory PalletsEventSendBarcodes() = _$PalletsEventSendBarcodes;
}

/// @nodoc
abstract class _$$PalletsEventClearBoxByIndexCopyWith<$Res> {
  factory _$$PalletsEventClearBoxByIndexCopyWith(
          _$PalletsEventClearBoxByIndex value,
          $Res Function(_$PalletsEventClearBoxByIndex) then) =
      __$$PalletsEventClearBoxByIndexCopyWithImpl<$Res>;
  @useResult
  $Res call({int indexBox, int indexPallet});
}

/// @nodoc
class __$$PalletsEventClearBoxByIndexCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res, _$PalletsEventClearBoxByIndex>
    implements _$$PalletsEventClearBoxByIndexCopyWith<$Res> {
  __$$PalletsEventClearBoxByIndexCopyWithImpl(
      _$PalletsEventClearBoxByIndex _value,
      $Res Function(_$PalletsEventClearBoxByIndex) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indexBox = null,
    Object? indexPallet = null,
  }) {
    return _then(_$PalletsEventClearBoxByIndex(
      indexBox: null == indexBox
          ? _value.indexBox
          : indexBox // ignore: cast_nullable_to_non_nullable
              as int,
      indexPallet: null == indexPallet
          ? _value.indexPallet
          : indexPallet // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PalletsEventClearBoxByIndex implements PalletsEventClearBoxByIndex {
  const _$PalletsEventClearBoxByIndex(
      {required this.indexBox, required this.indexPallet});

  @override
  final int indexBox;
  @override
  final int indexPallet;

  @override
  String toString() {
    return 'PalletsEvent.clearBoxByIndex(indexBox: $indexBox, indexPallet: $indexPallet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventClearBoxByIndex &&
            (identical(other.indexBox, indexBox) ||
                other.indexBox == indexBox) &&
            (identical(other.indexPallet, indexPallet) ||
                other.indexPallet == indexPallet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, indexBox, indexPallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PalletsEventClearBoxByIndexCopyWith<_$PalletsEventClearBoxByIndex>
      get copyWith => __$$PalletsEventClearBoxByIndexCopyWithImpl<
          _$PalletsEventClearBoxByIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return clearBoxByIndex(indexBox, indexPallet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return clearBoxByIndex?.call(indexBox, indexPallet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (clearBoxByIndex != null) {
      return clearBoxByIndex(indexBox, indexPallet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return clearBoxByIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return clearBoxByIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (clearBoxByIndex != null) {
      return clearBoxByIndex(this);
    }
    return orElse();
  }
}

abstract class PalletsEventClearBoxByIndex implements PalletsEvent {
  const factory PalletsEventClearBoxByIndex(
      {required final int indexBox,
      required final int indexPallet}) = _$PalletsEventClearBoxByIndex;

  int get indexBox;
  int get indexPallet;
  @JsonKey(ignore: true)
  _$$PalletsEventClearBoxByIndexCopyWith<_$PalletsEventClearBoxByIndex>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PalletsEventDeleteBoxByIndexCopyWith<$Res> {
  factory _$$PalletsEventDeleteBoxByIndexCopyWith(
          _$PalletsEventDeleteBoxByIndex value,
          $Res Function(_$PalletsEventDeleteBoxByIndex) then) =
      __$$PalletsEventDeleteBoxByIndexCopyWithImpl<$Res>;
  @useResult
  $Res call({int indexBox, int indexPallet, String barcodeBox});
}

/// @nodoc
class __$$PalletsEventDeleteBoxByIndexCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res, _$PalletsEventDeleteBoxByIndex>
    implements _$$PalletsEventDeleteBoxByIndexCopyWith<$Res> {
  __$$PalletsEventDeleteBoxByIndexCopyWithImpl(
      _$PalletsEventDeleteBoxByIndex _value,
      $Res Function(_$PalletsEventDeleteBoxByIndex) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indexBox = null,
    Object? indexPallet = null,
    Object? barcodeBox = null,
  }) {
    return _then(_$PalletsEventDeleteBoxByIndex(
      indexBox: null == indexBox
          ? _value.indexBox
          : indexBox // ignore: cast_nullable_to_non_nullable
              as int,
      indexPallet: null == indexPallet
          ? _value.indexPallet
          : indexPallet // ignore: cast_nullable_to_non_nullable
              as int,
      barcodeBox: null == barcodeBox
          ? _value.barcodeBox
          : barcodeBox // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PalletsEventDeleteBoxByIndex implements PalletsEventDeleteBoxByIndex {
  const _$PalletsEventDeleteBoxByIndex(
      {required this.indexBox,
      required this.indexPallet,
      required this.barcodeBox});

  @override
  final int indexBox;
  @override
  final int indexPallet;
  @override
  final String barcodeBox;

  @override
  String toString() {
    return 'PalletsEvent.deleteBoxByIndex(indexBox: $indexBox, indexPallet: $indexPallet, barcodeBox: $barcodeBox)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventDeleteBoxByIndex &&
            (identical(other.indexBox, indexBox) ||
                other.indexBox == indexBox) &&
            (identical(other.indexPallet, indexPallet) ||
                other.indexPallet == indexPallet) &&
            (identical(other.barcodeBox, barcodeBox) ||
                other.barcodeBox == barcodeBox));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, indexBox, indexPallet, barcodeBox);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PalletsEventDeleteBoxByIndexCopyWith<_$PalletsEventDeleteBoxByIndex>
      get copyWith => __$$PalletsEventDeleteBoxByIndexCopyWithImpl<
          _$PalletsEventDeleteBoxByIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return deleteBoxByIndex(indexBox, indexPallet, barcodeBox);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return deleteBoxByIndex?.call(indexBox, indexPallet, barcodeBox);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (deleteBoxByIndex != null) {
      return deleteBoxByIndex(indexBox, indexPallet, barcodeBox);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return deleteBoxByIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return deleteBoxByIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (deleteBoxByIndex != null) {
      return deleteBoxByIndex(this);
    }
    return orElse();
  }
}

abstract class PalletsEventDeleteBoxByIndex implements PalletsEvent {
  const factory PalletsEventDeleteBoxByIndex(
      {required final int indexBox,
      required final int indexPallet,
      required final String barcodeBox}) = _$PalletsEventDeleteBoxByIndex;

  int get indexBox;
  int get indexPallet;
  String get barcodeBox;
  @JsonKey(ignore: true)
  _$$PalletsEventDeleteBoxByIndexCopyWith<_$PalletsEventDeleteBoxByIndex>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PalletsEventCreateUnitByIndexCopyWith<$Res> {
  factory _$$PalletsEventCreateUnitByIndexCopyWith(
          _$PalletsEventCreateUnitByIndex value,
          $Res Function(_$PalletsEventCreateUnitByIndex) then) =
      __$$PalletsEventCreateUnitByIndexCopyWithImpl<$Res>;
  @useResult
  $Res call({int indexBox, int indexPallet, String barcode});
}

/// @nodoc
class __$$PalletsEventCreateUnitByIndexCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res, _$PalletsEventCreateUnitByIndex>
    implements _$$PalletsEventCreateUnitByIndexCopyWith<$Res> {
  __$$PalletsEventCreateUnitByIndexCopyWithImpl(
      _$PalletsEventCreateUnitByIndex _value,
      $Res Function(_$PalletsEventCreateUnitByIndex) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indexBox = null,
    Object? indexPallet = null,
    Object? barcode = null,
  }) {
    return _then(_$PalletsEventCreateUnitByIndex(
      indexBox: null == indexBox
          ? _value.indexBox
          : indexBox // ignore: cast_nullable_to_non_nullable
              as int,
      indexPallet: null == indexPallet
          ? _value.indexPallet
          : indexPallet // ignore: cast_nullable_to_non_nullable
              as int,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PalletsEventCreateUnitByIndex implements PalletsEventCreateUnitByIndex {
  const _$PalletsEventCreateUnitByIndex(
      {required this.indexBox,
      required this.indexPallet,
      required this.barcode});

  @override
  final int indexBox;
  @override
  final int indexPallet;
  @override
  final String barcode;

  @override
  String toString() {
    return 'PalletsEvent.createUnitByIndex(indexBox: $indexBox, indexPallet: $indexPallet, barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventCreateUnitByIndex &&
            (identical(other.indexBox, indexBox) ||
                other.indexBox == indexBox) &&
            (identical(other.indexPallet, indexPallet) ||
                other.indexPallet == indexPallet) &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, indexBox, indexPallet, barcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PalletsEventCreateUnitByIndexCopyWith<_$PalletsEventCreateUnitByIndex>
      get copyWith => __$$PalletsEventCreateUnitByIndexCopyWithImpl<
          _$PalletsEventCreateUnitByIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return createUnitByIndex(indexBox, indexPallet, barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return createUnitByIndex?.call(indexBox, indexPallet, barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (createUnitByIndex != null) {
      return createUnitByIndex(indexBox, indexPallet, barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return createUnitByIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return createUnitByIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (createUnitByIndex != null) {
      return createUnitByIndex(this);
    }
    return orElse();
  }
}

abstract class PalletsEventCreateUnitByIndex implements PalletsEvent {
  const factory PalletsEventCreateUnitByIndex(
      {required final int indexBox,
      required final int indexPallet,
      required final String barcode}) = _$PalletsEventCreateUnitByIndex;

  int get indexBox;
  int get indexPallet;
  String get barcode;
  @JsonKey(ignore: true)
  _$$PalletsEventCreateUnitByIndexCopyWith<_$PalletsEventCreateUnitByIndex>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PalletsEventClearAllCurrentUnitsCopyWith<$Res> {
  factory _$$PalletsEventClearAllCurrentUnitsCopyWith(
          _$PalletsEventClearAllCurrentUnits value,
          $Res Function(_$PalletsEventClearAllCurrentUnits) then) =
      __$$PalletsEventClearAllCurrentUnitsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PalletsEventClearAllCurrentUnitsCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res, _$PalletsEventClearAllCurrentUnits>
    implements _$$PalletsEventClearAllCurrentUnitsCopyWith<$Res> {
  __$$PalletsEventClearAllCurrentUnitsCopyWithImpl(
      _$PalletsEventClearAllCurrentUnits _value,
      $Res Function(_$PalletsEventClearAllCurrentUnits) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PalletsEventClearAllCurrentUnits
    implements PalletsEventClearAllCurrentUnits {
  const _$PalletsEventClearAllCurrentUnits();

  @override
  String toString() {
    return 'PalletsEvent.clearAllCurrentUnits()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventClearAllCurrentUnits);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return clearAllCurrentUnits();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return clearAllCurrentUnits?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (clearAllCurrentUnits != null) {
      return clearAllCurrentUnits();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return clearAllCurrentUnits(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return clearAllCurrentUnits?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (clearAllCurrentUnits != null) {
      return clearAllCurrentUnits(this);
    }
    return orElse();
  }
}

abstract class PalletsEventClearAllCurrentUnits implements PalletsEvent {
  const factory PalletsEventClearAllCurrentUnits() =
      _$PalletsEventClearAllCurrentUnits;
}

/// @nodoc
abstract class _$$PalletsEventClearCurrentUnitsByBarcodeCopyWith<$Res> {
  factory _$$PalletsEventClearCurrentUnitsByBarcodeCopyWith(
          _$PalletsEventClearCurrentUnitsByBarcode value,
          $Res Function(_$PalletsEventClearCurrentUnitsByBarcode) then) =
      __$$PalletsEventClearCurrentUnitsByBarcodeCopyWithImpl<$Res>;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class __$$PalletsEventClearCurrentUnitsByBarcodeCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res,
        _$PalletsEventClearCurrentUnitsByBarcode>
    implements _$$PalletsEventClearCurrentUnitsByBarcodeCopyWith<$Res> {
  __$$PalletsEventClearCurrentUnitsByBarcodeCopyWithImpl(
      _$PalletsEventClearCurrentUnitsByBarcode _value,
      $Res Function(_$PalletsEventClearCurrentUnitsByBarcode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
  }) {
    return _then(_$PalletsEventClearCurrentUnitsByBarcode(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PalletsEventClearCurrentUnitsByBarcode
    implements PalletsEventClearCurrentUnitsByBarcode {
  const _$PalletsEventClearCurrentUnitsByBarcode({required this.barcode});

  @override
  final String barcode;

  @override
  String toString() {
    return 'PalletsEvent.clearCurrentUnitsByBarcode(barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventClearCurrentUnitsByBarcode &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PalletsEventClearCurrentUnitsByBarcodeCopyWith<
          _$PalletsEventClearCurrentUnitsByBarcode>
      get copyWith => __$$PalletsEventClearCurrentUnitsByBarcodeCopyWithImpl<
          _$PalletsEventClearCurrentUnitsByBarcode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return clearCurrentUnitsByBarcode(barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return clearCurrentUnitsByBarcode?.call(barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (clearCurrentUnitsByBarcode != null) {
      return clearCurrentUnitsByBarcode(barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return clearCurrentUnitsByBarcode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return clearCurrentUnitsByBarcode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (clearCurrentUnitsByBarcode != null) {
      return clearCurrentUnitsByBarcode(this);
    }
    return orElse();
  }
}

abstract class PalletsEventClearCurrentUnitsByBarcode implements PalletsEvent {
  const factory PalletsEventClearCurrentUnitsByBarcode(
          {required final String barcode}) =
      _$PalletsEventClearCurrentUnitsByBarcode;

  String get barcode;
  @JsonKey(ignore: true)
  _$$PalletsEventClearCurrentUnitsByBarcodeCopyWith<
          _$PalletsEventClearCurrentUnitsByBarcode>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PalletsEventChangeDateReleaseCopyWith<$Res> {
  factory _$$PalletsEventChangeDateReleaseCopyWith(
          _$PalletsEventChangeDateRelease value,
          $Res Function(_$PalletsEventChangeDateRelease) then) =
      __$$PalletsEventChangeDateReleaseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PalletsEventChangeDateReleaseCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res, _$PalletsEventChangeDateRelease>
    implements _$$PalletsEventChangeDateReleaseCopyWith<$Res> {
  __$$PalletsEventChangeDateReleaseCopyWithImpl(
      _$PalletsEventChangeDateRelease _value,
      $Res Function(_$PalletsEventChangeDateRelease) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PalletsEventChangeDateRelease implements PalletsEventChangeDateRelease {
  const _$PalletsEventChangeDateRelease();

  @override
  String toString() {
    return 'PalletsEvent.changeDateRelease()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventChangeDateRelease);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return changeDateRelease();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return changeDateRelease?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (changeDateRelease != null) {
      return changeDateRelease();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return changeDateRelease(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return changeDateRelease?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (changeDateRelease != null) {
      return changeDateRelease(this);
    }
    return orElse();
  }
}

abstract class PalletsEventChangeDateRelease implements PalletsEvent {
  const factory PalletsEventChangeDateRelease() =
      _$PalletsEventChangeDateRelease;
}

/// @nodoc
abstract class _$$PalletsEventCreateUnitCopyWith<$Res> {
  factory _$$PalletsEventCreateUnitCopyWith(_$PalletsEventCreateUnit value,
          $Res Function(_$PalletsEventCreateUnit) then) =
      __$$PalletsEventCreateUnitCopyWithImpl<$Res>;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class __$$PalletsEventCreateUnitCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res, _$PalletsEventCreateUnit>
    implements _$$PalletsEventCreateUnitCopyWith<$Res> {
  __$$PalletsEventCreateUnitCopyWithImpl(_$PalletsEventCreateUnit _value,
      $Res Function(_$PalletsEventCreateUnit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
  }) {
    return _then(_$PalletsEventCreateUnit(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PalletsEventCreateUnit implements PalletsEventCreateUnit {
  const _$PalletsEventCreateUnit({required this.barcode});

  @override
  final String barcode;

  @override
  String toString() {
    return 'PalletsEvent.createUnit(barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventCreateUnit &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PalletsEventCreateUnitCopyWith<_$PalletsEventCreateUnit> get copyWith =>
      __$$PalletsEventCreateUnitCopyWithImpl<_$PalletsEventCreateUnit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return createUnit(barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return createUnit?.call(barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (createUnit != null) {
      return createUnit(barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return createUnit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return createUnit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (createUnit != null) {
      return createUnit(this);
    }
    return orElse();
  }
}

abstract class PalletsEventCreateUnit implements PalletsEvent {
  const factory PalletsEventCreateUnit({required final String barcode}) =
      _$PalletsEventCreateUnit;

  String get barcode;
  @JsonKey(ignore: true)
  _$$PalletsEventCreateUnitCopyWith<_$PalletsEventCreateUnit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PalletsEventCreateBoxCopyWith<$Res> {
  factory _$$PalletsEventCreateBoxCopyWith(_$PalletsEventCreateBox value,
          $Res Function(_$PalletsEventCreateBox) then) =
      __$$PalletsEventCreateBoxCopyWithImpl<$Res>;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class __$$PalletsEventCreateBoxCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res, _$PalletsEventCreateBox>
    implements _$$PalletsEventCreateBoxCopyWith<$Res> {
  __$$PalletsEventCreateBoxCopyWithImpl(_$PalletsEventCreateBox _value,
      $Res Function(_$PalletsEventCreateBox) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
  }) {
    return _then(_$PalletsEventCreateBox(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PalletsEventCreateBox implements PalletsEventCreateBox {
  const _$PalletsEventCreateBox({required this.barcode});

  @override
  final String barcode;

  @override
  String toString() {
    return 'PalletsEvent.createBox(barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventCreateBox &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PalletsEventCreateBoxCopyWith<_$PalletsEventCreateBox> get copyWith =>
      __$$PalletsEventCreateBoxCopyWithImpl<_$PalletsEventCreateBox>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return createBox(barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return createBox?.call(barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (createBox != null) {
      return createBox(barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return createBox(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return createBox?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (createBox != null) {
      return createBox(this);
    }
    return orElse();
  }
}

abstract class PalletsEventCreateBox implements PalletsEvent {
  const factory PalletsEventCreateBox({required final String barcode}) =
      _$PalletsEventCreateBox;

  String get barcode;
  @JsonKey(ignore: true)
  _$$PalletsEventCreateBoxCopyWith<_$PalletsEventCreateBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PalletsEventCreatePalletCopyWith<$Res> {
  factory _$$PalletsEventCreatePalletCopyWith(_$PalletsEventCreatePallet value,
          $Res Function(_$PalletsEventCreatePallet) then) =
      __$$PalletsEventCreatePalletCopyWithImpl<$Res>;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class __$$PalletsEventCreatePalletCopyWithImpl<$Res>
    extends _$PalletsEventCopyWithImpl<$Res, _$PalletsEventCreatePallet>
    implements _$$PalletsEventCreatePalletCopyWith<$Res> {
  __$$PalletsEventCreatePalletCopyWithImpl(_$PalletsEventCreatePallet _value,
      $Res Function(_$PalletsEventCreatePallet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
  }) {
    return _then(_$PalletsEventCreatePallet(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PalletsEventCreatePallet implements PalletsEventCreatePallet {
  const _$PalletsEventCreatePallet({required this.barcode});

  @override
  final String barcode;

  @override
  String toString() {
    return 'PalletsEvent.createPallet(barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventCreatePallet &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PalletsEventCreatePalletCopyWith<_$PalletsEventCreatePallet>
      get copyWith =>
          __$$PalletsEventCreatePalletCopyWithImpl<_$PalletsEventCreatePallet>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function() sendBarcodes,
    required TResult Function(int indexBox, int indexPallet) clearBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcodeBox)
        deleteBoxByIndex,
    required TResult Function(int indexBox, int indexPallet, String barcode)
        createUnitByIndex,
    required TResult Function() clearAllCurrentUnits,
    required TResult Function(String barcode) clearCurrentUnitsByBarcode,
    required TResult Function() changeDateRelease,
    required TResult Function(String barcode) createUnit,
    required TResult Function(String barcode) createBox,
    required TResult Function(String barcode) createPallet,
  }) {
    return createPallet(barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function()? sendBarcodes,
    TResult? Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult? Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult? Function()? clearAllCurrentUnits,
    TResult? Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult? Function()? changeDateRelease,
    TResult? Function(String barcode)? createUnit,
    TResult? Function(String barcode)? createBox,
    TResult? Function(String barcode)? createPallet,
  }) {
    return createPallet?.call(barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function()? sendBarcodes,
    TResult Function(int indexBox, int indexPallet)? clearBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcodeBox)?
        deleteBoxByIndex,
    TResult Function(int indexBox, int indexPallet, String barcode)?
        createUnitByIndex,
    TResult Function()? clearAllCurrentUnits,
    TResult Function(String barcode)? clearCurrentUnitsByBarcode,
    TResult Function()? changeDateRelease,
    TResult Function(String barcode)? createUnit,
    TResult Function(String barcode)? createBox,
    TResult Function(String barcode)? createPallet,
    required TResult orElse(),
  }) {
    if (createPallet != null) {
      return createPallet(barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventSendBarcodes value) sendBarcodes,
    required TResult Function(PalletsEventClearBoxByIndex value)
        clearBoxByIndex,
    required TResult Function(PalletsEventDeleteBoxByIndex value)
        deleteBoxByIndex,
    required TResult Function(PalletsEventCreateUnitByIndex value)
        createUnitByIndex,
    required TResult Function(PalletsEventClearAllCurrentUnits value)
        clearAllCurrentUnits,
    required TResult Function(PalletsEventClearCurrentUnitsByBarcode value)
        clearCurrentUnitsByBarcode,
    required TResult Function(PalletsEventChangeDateRelease value)
        changeDateRelease,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
    required TResult Function(PalletsEventCreateBox value) createBox,
    required TResult Function(PalletsEventCreatePallet value) createPallet,
  }) {
    return createPallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult? Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult? Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult? Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult? Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult? Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult? Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
    TResult? Function(PalletsEventCreateBox value)? createBox,
    TResult? Function(PalletsEventCreatePallet value)? createPallet,
  }) {
    return createPallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventSendBarcodes value)? sendBarcodes,
    TResult Function(PalletsEventClearBoxByIndex value)? clearBoxByIndex,
    TResult Function(PalletsEventDeleteBoxByIndex value)? deleteBoxByIndex,
    TResult Function(PalletsEventCreateUnitByIndex value)? createUnitByIndex,
    TResult Function(PalletsEventClearAllCurrentUnits value)?
        clearAllCurrentUnits,
    TResult Function(PalletsEventClearCurrentUnitsByBarcode value)?
        clearCurrentUnitsByBarcode,
    TResult Function(PalletsEventChangeDateRelease value)? changeDateRelease,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    TResult Function(PalletsEventCreateBox value)? createBox,
    TResult Function(PalletsEventCreatePallet value)? createPallet,
    required TResult orElse(),
  }) {
    if (createPallet != null) {
      return createPallet(this);
    }
    return orElse();
  }
}

abstract class PalletsEventCreatePallet implements PalletsEvent {
  const factory PalletsEventCreatePallet({required final String barcode}) =
      _$PalletsEventCreatePallet;

  String get barcode;
  @JsonKey(ignore: true)
  _$$PalletsEventCreatePalletCopyWith<_$PalletsEventCreatePallet>
      get copyWith => throw _privateConstructorUsedError;
}

PalletsState _$PalletsStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return PalletsStateLoading.fromJson(json);
    case 'loaded':
      return PalletsStateLoaded.fromJson(json);
    case 'error':
      return PalletsStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PalletsState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PalletsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)
        loaded,
    required TResult Function(String? errorText) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)?
        loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsStateLoading value) loading,
    required TResult Function(PalletsStateLoaded value) loaded,
    required TResult Function(PalletsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsStateLoading value)? loading,
    TResult? Function(PalletsStateLoaded value)? loaded,
    TResult? Function(PalletsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsStateLoading value)? loading,
    TResult Function(PalletsStateLoaded value)? loaded,
    TResult Function(PalletsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PalletsStateCopyWith<$Res> {
  factory $PalletsStateCopyWith(
          PalletsState value, $Res Function(PalletsState) then) =
      _$PalletsStateCopyWithImpl<$Res, PalletsState>;
}

/// @nodoc
class _$PalletsStateCopyWithImpl<$Res, $Val extends PalletsState>
    implements $PalletsStateCopyWith<$Res> {
  _$PalletsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PalletsStateLoadingCopyWith<$Res> {
  factory _$$PalletsStateLoadingCopyWith(_$PalletsStateLoading value,
          $Res Function(_$PalletsStateLoading) then) =
      __$$PalletsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PalletsStateLoadingCopyWithImpl<$Res>
    extends _$PalletsStateCopyWithImpl<$Res, _$PalletsStateLoading>
    implements _$$PalletsStateLoadingCopyWith<$Res> {
  __$$PalletsStateLoadingCopyWithImpl(
      _$PalletsStateLoading _value, $Res Function(_$PalletsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PalletsStateLoading implements PalletsStateLoading {
  const _$PalletsStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$PalletsStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$PalletsStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PalletsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PalletsStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)
        loaded,
    required TResult Function(String? errorText) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)?
        loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsStateLoading value) loading,
    required TResult Function(PalletsStateLoaded value) loaded,
    required TResult Function(PalletsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsStateLoading value)? loading,
    TResult? Function(PalletsStateLoaded value)? loaded,
    TResult? Function(PalletsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsStateLoading value)? loading,
    TResult Function(PalletsStateLoaded value)? loaded,
    TResult Function(PalletsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PalletsStateLoadingToJson(
      this,
    );
  }
}

abstract class PalletsStateLoading implements PalletsState {
  const factory PalletsStateLoading() = _$PalletsStateLoading;

  factory PalletsStateLoading.fromJson(Map<String, dynamic> json) =
      _$PalletsStateLoading.fromJson;
}

/// @nodoc
abstract class _$$PalletsStateLoadedCopyWith<$Res> {
  factory _$$PalletsStateLoadedCopyWith(_$PalletsStateLoaded value,
          $Res Function(_$PalletsStateLoaded) then) =
      __$$PalletsStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ListPallets listPallets,
      List<Item> units,
      Set<String> allBarcodeHistory,
      Set<String> currentBarcodeHistory,
      int countBarcodes,
      int maxIndexUnitInBox,
      int countBox});

  $ListPalletsCopyWith<$Res> get listPallets;
}

/// @nodoc
class __$$PalletsStateLoadedCopyWithImpl<$Res>
    extends _$PalletsStateCopyWithImpl<$Res, _$PalletsStateLoaded>
    implements _$$PalletsStateLoadedCopyWith<$Res> {
  __$$PalletsStateLoadedCopyWithImpl(
      _$PalletsStateLoaded _value, $Res Function(_$PalletsStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listPallets = null,
    Object? units = null,
    Object? allBarcodeHistory = null,
    Object? currentBarcodeHistory = null,
    Object? countBarcodes = null,
    Object? maxIndexUnitInBox = null,
    Object? countBox = null,
  }) {
    return _then(_$PalletsStateLoaded(
      listPallets: null == listPallets
          ? _value.listPallets
          : listPallets // ignore: cast_nullable_to_non_nullable
              as ListPallets,
      units: null == units
          ? _value._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      allBarcodeHistory: null == allBarcodeHistory
          ? _value._allBarcodeHistory
          : allBarcodeHistory // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      currentBarcodeHistory: null == currentBarcodeHistory
          ? _value._currentBarcodeHistory
          : currentBarcodeHistory // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      countBarcodes: null == countBarcodes
          ? _value.countBarcodes
          : countBarcodes // ignore: cast_nullable_to_non_nullable
              as int,
      maxIndexUnitInBox: null == maxIndexUnitInBox
          ? _value.maxIndexUnitInBox
          : maxIndexUnitInBox // ignore: cast_nullable_to_non_nullable
              as int,
      countBox: null == countBox
          ? _value.countBox
          : countBox // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ListPalletsCopyWith<$Res> get listPallets {
    return $ListPalletsCopyWith<$Res>(_value.listPallets, (value) {
      return _then(_value.copyWith(listPallets: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$PalletsStateLoaded implements PalletsStateLoaded {
  const _$PalletsStateLoaded(
      {required this.listPallets,
      required final List<Item> units,
      required final Set<String> allBarcodeHistory,
      required final Set<String> currentBarcodeHistory,
      required this.countBarcodes,
      required this.maxIndexUnitInBox,
      required this.countBox,
      final String? $type})
      : _units = units,
        _allBarcodeHistory = allBarcodeHistory,
        _currentBarcodeHistory = currentBarcodeHistory,
        $type = $type ?? 'loaded';

  factory _$PalletsStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$PalletsStateLoadedFromJson(json);

  @override
  final ListPallets listPallets;
  final List<Item> _units;
  @override
  List<Item> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  final Set<String> _allBarcodeHistory;
  @override
  Set<String> get allBarcodeHistory {
    if (_allBarcodeHistory is EqualUnmodifiableSetView)
      return _allBarcodeHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_allBarcodeHistory);
  }

  final Set<String> _currentBarcodeHistory;
  @override
  Set<String> get currentBarcodeHistory {
    if (_currentBarcodeHistory is EqualUnmodifiableSetView)
      return _currentBarcodeHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_currentBarcodeHistory);
  }

  @override
  final int countBarcodes;
  @override
  final int maxIndexUnitInBox;
  @override
  final int countBox;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PalletsState.loaded(listPallets: $listPallets, units: $units, allBarcodeHistory: $allBarcodeHistory, currentBarcodeHistory: $currentBarcodeHistory, countBarcodes: $countBarcodes, maxIndexUnitInBox: $maxIndexUnitInBox, countBox: $countBox)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsStateLoaded &&
            (identical(other.listPallets, listPallets) ||
                other.listPallets == listPallets) &&
            const DeepCollectionEquality().equals(other._units, _units) &&
            const DeepCollectionEquality()
                .equals(other._allBarcodeHistory, _allBarcodeHistory) &&
            const DeepCollectionEquality()
                .equals(other._currentBarcodeHistory, _currentBarcodeHistory) &&
            (identical(other.countBarcodes, countBarcodes) ||
                other.countBarcodes == countBarcodes) &&
            (identical(other.maxIndexUnitInBox, maxIndexUnitInBox) ||
                other.maxIndexUnitInBox == maxIndexUnitInBox) &&
            (identical(other.countBox, countBox) ||
                other.countBox == countBox));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      listPallets,
      const DeepCollectionEquality().hash(_units),
      const DeepCollectionEquality().hash(_allBarcodeHistory),
      const DeepCollectionEquality().hash(_currentBarcodeHistory),
      countBarcodes,
      maxIndexUnitInBox,
      countBox);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PalletsStateLoadedCopyWith<_$PalletsStateLoaded> get copyWith =>
      __$$PalletsStateLoadedCopyWithImpl<_$PalletsStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)
        loaded,
    required TResult Function(String? errorText) error,
  }) {
    return loaded(listPallets, units, allBarcodeHistory, currentBarcodeHistory,
        countBarcodes, maxIndexUnitInBox, countBox);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return loaded?.call(listPallets, units, allBarcodeHistory,
        currentBarcodeHistory, countBarcodes, maxIndexUnitInBox, countBox);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)?
        loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(listPallets, units, allBarcodeHistory,
          currentBarcodeHistory, countBarcodes, maxIndexUnitInBox, countBox);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsStateLoading value) loading,
    required TResult Function(PalletsStateLoaded value) loaded,
    required TResult Function(PalletsStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsStateLoading value)? loading,
    TResult? Function(PalletsStateLoaded value)? loaded,
    TResult? Function(PalletsStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsStateLoading value)? loading,
    TResult Function(PalletsStateLoaded value)? loaded,
    TResult Function(PalletsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PalletsStateLoadedToJson(
      this,
    );
  }
}

abstract class PalletsStateLoaded implements PalletsState {
  const factory PalletsStateLoaded(
      {required final ListPallets listPallets,
      required final List<Item> units,
      required final Set<String> allBarcodeHistory,
      required final Set<String> currentBarcodeHistory,
      required final int countBarcodes,
      required final int maxIndexUnitInBox,
      required final int countBox}) = _$PalletsStateLoaded;

  factory PalletsStateLoaded.fromJson(Map<String, dynamic> json) =
      _$PalletsStateLoaded.fromJson;

  ListPallets get listPallets;
  List<Item> get units;
  Set<String> get allBarcodeHistory;
  Set<String> get currentBarcodeHistory;
  int get countBarcodes;
  int get maxIndexUnitInBox;
  int get countBox;
  @JsonKey(ignore: true)
  _$$PalletsStateLoadedCopyWith<_$PalletsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PalletsStateErrorCopyWith<$Res> {
  factory _$$PalletsStateErrorCopyWith(
          _$PalletsStateError value, $Res Function(_$PalletsStateError) then) =
      __$$PalletsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorText});
}

/// @nodoc
class __$$PalletsStateErrorCopyWithImpl<$Res>
    extends _$PalletsStateCopyWithImpl<$Res, _$PalletsStateError>
    implements _$$PalletsStateErrorCopyWith<$Res> {
  __$$PalletsStateErrorCopyWithImpl(
      _$PalletsStateError _value, $Res Function(_$PalletsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_$PalletsStateError(
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PalletsStateError implements PalletsStateError {
  const _$PalletsStateError({this.errorText, final String? $type})
      : $type = $type ?? 'error';

  factory _$PalletsStateError.fromJson(Map<String, dynamic> json) =>
      _$$PalletsStateErrorFromJson(json);

  @override
  final String? errorText;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PalletsState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsStateError &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PalletsStateErrorCopyWith<_$PalletsStateError> get copyWith =>
      __$$PalletsStateErrorCopyWithImpl<_$PalletsStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)
        loaded,
    required TResult Function(String? errorText) error,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            ListPallets listPallets,
            List<Item> units,
            Set<String> allBarcodeHistory,
            Set<String> currentBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)?
        loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsStateLoading value) loading,
    required TResult Function(PalletsStateLoaded value) loaded,
    required TResult Function(PalletsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsStateLoading value)? loading,
    TResult? Function(PalletsStateLoaded value)? loaded,
    TResult? Function(PalletsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsStateLoading value)? loading,
    TResult Function(PalletsStateLoaded value)? loaded,
    TResult Function(PalletsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PalletsStateErrorToJson(
      this,
    );
  }
}

abstract class PalletsStateError implements PalletsState {
  const factory PalletsStateError({final String? errorText}) =
      _$PalletsStateError;

  factory PalletsStateError.fromJson(Map<String, dynamic> json) =
      _$PalletsStateError.fromJson;

  String? get errorText;
  @JsonKey(ignore: true)
  _$$PalletsStateErrorCopyWith<_$PalletsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
