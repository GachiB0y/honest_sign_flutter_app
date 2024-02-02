// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_state_pallets_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModelStatePalletsBloc _$ModelStatePalletsBlocFromJson(
    Map<String, dynamic> json) {
  return _ModelStatePalletsBloc.fromJson(json);
}

/// @nodoc
mixin _$ModelStatePalletsBloc {
  ListPallets get listPallets => throw _privateConstructorUsedError;
  List<Item> get units => throw _privateConstructorUsedError;
  Set<String> get allBarcodeHistory => throw _privateConstructorUsedError;
  Set<String> get currentBarcodeHistory => throw _privateConstructorUsedError;
  int get countBarcodes => throw _privateConstructorUsedError;
  int get maxIndexUnitInBox => throw _privateConstructorUsedError;
  int get countBox => throw _privateConstructorUsedError;
  bool? get isLoading => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;
  bool? get isNewRelease => throw _privateConstructorUsedError;
  String? get gtin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelStatePalletsBlocCopyWith<ModelStatePalletsBloc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelStatePalletsBlocCopyWith<$Res> {
  factory $ModelStatePalletsBlocCopyWith(ModelStatePalletsBloc value,
          $Res Function(ModelStatePalletsBloc) then) =
      _$ModelStatePalletsBlocCopyWithImpl<$Res, ModelStatePalletsBloc>;
  @useResult
  $Res call(
      {ListPallets listPallets,
      List<Item> units,
      Set<String> allBarcodeHistory,
      Set<String> currentBarcodeHistory,
      int countBarcodes,
      int maxIndexUnitInBox,
      int countBox,
      bool? isLoading,
      String? errorText,
      bool? isNewRelease,
      String? gtin});

  $ListPalletsCopyWith<$Res> get listPallets;
}

/// @nodoc
class _$ModelStatePalletsBlocCopyWithImpl<$Res,
        $Val extends ModelStatePalletsBloc>
    implements $ModelStatePalletsBlocCopyWith<$Res> {
  _$ModelStatePalletsBlocCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? isLoading = freezed,
    Object? errorText = freezed,
    Object? isNewRelease = freezed,
    Object? gtin = freezed,
  }) {
    return _then(_value.copyWith(
      listPallets: null == listPallets
          ? _value.listPallets
          : listPallets // ignore: cast_nullable_to_non_nullable
              as ListPallets,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      allBarcodeHistory: null == allBarcodeHistory
          ? _value.allBarcodeHistory
          : allBarcodeHistory // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      currentBarcodeHistory: null == currentBarcodeHistory
          ? _value.currentBarcodeHistory
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
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      isNewRelease: freezed == isNewRelease
          ? _value.isNewRelease
          : isNewRelease // ignore: cast_nullable_to_non_nullable
              as bool?,
      gtin: freezed == gtin
          ? _value.gtin
          : gtin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ListPalletsCopyWith<$Res> get listPallets {
    return $ListPalletsCopyWith<$Res>(_value.listPallets, (value) {
      return _then(_value.copyWith(listPallets: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ModelStatePalletsBlocCopyWith<$Res>
    implements $ModelStatePalletsBlocCopyWith<$Res> {
  factory _$$_ModelStatePalletsBlocCopyWith(_$_ModelStatePalletsBloc value,
          $Res Function(_$_ModelStatePalletsBloc) then) =
      __$$_ModelStatePalletsBlocCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ListPallets listPallets,
      List<Item> units,
      Set<String> allBarcodeHistory,
      Set<String> currentBarcodeHistory,
      int countBarcodes,
      int maxIndexUnitInBox,
      int countBox,
      bool? isLoading,
      String? errorText,
      bool? isNewRelease,
      String? gtin});

  @override
  $ListPalletsCopyWith<$Res> get listPallets;
}

/// @nodoc
class __$$_ModelStatePalletsBlocCopyWithImpl<$Res>
    extends _$ModelStatePalletsBlocCopyWithImpl<$Res, _$_ModelStatePalletsBloc>
    implements _$$_ModelStatePalletsBlocCopyWith<$Res> {
  __$$_ModelStatePalletsBlocCopyWithImpl(_$_ModelStatePalletsBloc _value,
      $Res Function(_$_ModelStatePalletsBloc) _then)
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
    Object? isLoading = freezed,
    Object? errorText = freezed,
    Object? isNewRelease = freezed,
    Object? gtin = freezed,
  }) {
    return _then(_$_ModelStatePalletsBloc(
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
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      isNewRelease: freezed == isNewRelease
          ? _value.isNewRelease
          : isNewRelease // ignore: cast_nullable_to_non_nullable
              as bool?,
      gtin: freezed == gtin
          ? _value.gtin
          : gtin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModelStatePalletsBloc implements _ModelStatePalletsBloc {
  const _$_ModelStatePalletsBloc(
      {required this.listPallets,
      required final List<Item> units,
      required final Set<String> allBarcodeHistory,
      required final Set<String> currentBarcodeHistory,
      required this.countBarcodes,
      required this.maxIndexUnitInBox,
      required this.countBox,
      this.isLoading,
      this.errorText,
      this.isNewRelease,
      this.gtin})
      : _units = units,
        _allBarcodeHistory = allBarcodeHistory,
        _currentBarcodeHistory = currentBarcodeHistory;

  factory _$_ModelStatePalletsBloc.fromJson(Map<String, dynamic> json) =>
      _$$_ModelStatePalletsBlocFromJson(json);

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
  @override
  final bool? isLoading;
  @override
  final String? errorText;
  @override
  final bool? isNewRelease;
  @override
  final String? gtin;

  @override
  String toString() {
    return 'ModelStatePalletsBloc(listPallets: $listPallets, units: $units, allBarcodeHistory: $allBarcodeHistory, currentBarcodeHistory: $currentBarcodeHistory, countBarcodes: $countBarcodes, maxIndexUnitInBox: $maxIndexUnitInBox, countBox: $countBox, isLoading: $isLoading, errorText: $errorText, isNewRelease: $isNewRelease, gtin: $gtin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModelStatePalletsBloc &&
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
                other.countBox == countBox) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            (identical(other.isNewRelease, isNewRelease) ||
                other.isNewRelease == isNewRelease) &&
            (identical(other.gtin, gtin) || other.gtin == gtin));
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
      countBox,
      isLoading,
      errorText,
      isNewRelease,
      gtin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModelStatePalletsBlocCopyWith<_$_ModelStatePalletsBloc> get copyWith =>
      __$$_ModelStatePalletsBlocCopyWithImpl<_$_ModelStatePalletsBloc>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModelStatePalletsBlocToJson(
      this,
    );
  }
}

abstract class _ModelStatePalletsBloc implements ModelStatePalletsBloc {
  const factory _ModelStatePalletsBloc(
      {required final ListPallets listPallets,
      required final List<Item> units,
      required final Set<String> allBarcodeHistory,
      required final Set<String> currentBarcodeHistory,
      required final int countBarcodes,
      required final int maxIndexUnitInBox,
      required final int countBox,
      final bool? isLoading,
      final String? errorText,
      final bool? isNewRelease,
      final String? gtin}) = _$_ModelStatePalletsBloc;

  factory _ModelStatePalletsBloc.fromJson(Map<String, dynamic> json) =
      _$_ModelStatePalletsBloc.fromJson;

  @override
  ListPallets get listPallets;
  @override
  List<Item> get units;
  @override
  Set<String> get allBarcodeHistory;
  @override
  Set<String> get currentBarcodeHistory;
  @override
  int get countBarcodes;
  @override
  int get maxIndexUnitInBox;
  @override
  int get countBox;
  @override
  bool? get isLoading;
  @override
  String? get errorText;
  @override
  bool? get isNewRelease;
  @override
  String? get gtin;
  @override
  @JsonKey(ignore: true)
  _$$_ModelStatePalletsBlocCopyWith<_$_ModelStatePalletsBloc> get copyWith =>
      throw _privateConstructorUsedError;
}
