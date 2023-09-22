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
    required TResult Function(String barcode, String formattedDateTime)
        createUnit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String barcode, String formattedDateTime)? createUnit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String barcode, String formattedDateTime)? createUnit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
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
    required TResult Function(String barcode, String formattedDateTime)
        createUnit,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String barcode, String formattedDateTime)? createUnit,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String barcode, String formattedDateTime)? createUnit,
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
    required TResult Function(PalletsEventCreateUnit value) createUnit,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
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
abstract class _$$PalletsEventCreateUnitCopyWith<$Res> {
  factory _$$PalletsEventCreateUnitCopyWith(_$PalletsEventCreateUnit value,
          $Res Function(_$PalletsEventCreateUnit) then) =
      __$$PalletsEventCreateUnitCopyWithImpl<$Res>;
  @useResult
  $Res call({String barcode, String formattedDateTime});
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
    Object? formattedDateTime = null,
  }) {
    return _then(_$PalletsEventCreateUnit(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      formattedDateTime: null == formattedDateTime
          ? _value.formattedDateTime
          : formattedDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PalletsEventCreateUnit implements PalletsEventCreateUnit {
  const _$PalletsEventCreateUnit(
      {required this.barcode, required this.formattedDateTime});

  @override
  final String barcode;
  @override
  final String formattedDateTime;

  @override
  String toString() {
    return 'PalletsEvent.createUnit(barcode: $barcode, formattedDateTime: $formattedDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsEventCreateUnit &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.formattedDateTime, formattedDateTime) ||
                other.formattedDateTime == formattedDateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode, formattedDateTime);

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
    required TResult Function(String barcode, String formattedDateTime)
        createUnit,
  }) {
    return createUnit(barcode, formattedDateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String barcode, String formattedDateTime)? createUnit,
  }) {
    return createUnit?.call(barcode, formattedDateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String barcode, String formattedDateTime)? createUnit,
    required TResult orElse(),
  }) {
    if (createUnit != null) {
      return createUnit(barcode, formattedDateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PalletsEventFetch value) fetch,
    required TResult Function(PalletsEventCreateUnit value) createUnit,
  }) {
    return createUnit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PalletsEventFetch value)? fetch,
    TResult? Function(PalletsEventCreateUnit value)? createUnit,
  }) {
    return createUnit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PalletsEventFetch value)? fetch,
    TResult Function(PalletsEventCreateUnit value)? createUnit,
    required TResult orElse(),
  }) {
    if (createUnit != null) {
      return createUnit(this);
    }
    return orElse();
  }
}

abstract class PalletsEventCreateUnit implements PalletsEvent {
  const factory PalletsEventCreateUnit(
      {required final String barcode,
      required final String formattedDateTime}) = _$PalletsEventCreateUnit;

  String get barcode;
  String get formattedDateTime;
  @JsonKey(ignore: true)
  _$$PalletsEventCreateUnitCopyWith<_$PalletsEventCreateUnit> get copyWith =>
      throw _privateConstructorUsedError;
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
            Set<String> allBarcodeHistory,
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
    TResult? Function(ListPallets listPallets, Set<String> allBarcodeHistory,
            int countBarcodes, int maxIndexUnitInBox, int countBox)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ListPallets listPallets, Set<String> allBarcodeHistory,
            int countBarcodes, int maxIndexUnitInBox, int countBox)?
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
            Set<String> allBarcodeHistory,
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
    TResult? Function(ListPallets listPallets, Set<String> allBarcodeHistory,
            int countBarcodes, int maxIndexUnitInBox, int countBox)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ListPallets listPallets, Set<String> allBarcodeHistory,
            int countBarcodes, int maxIndexUnitInBox, int countBox)?
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
      Set<String> allBarcodeHistory,
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
    Object? allBarcodeHistory = null,
    Object? countBarcodes = null,
    Object? maxIndexUnitInBox = null,
    Object? countBox = null,
  }) {
    return _then(_$PalletsStateLoaded(
      listPallets: null == listPallets
          ? _value.listPallets
          : listPallets // ignore: cast_nullable_to_non_nullable
              as ListPallets,
      allBarcodeHistory: null == allBarcodeHistory
          ? _value._allBarcodeHistory
          : allBarcodeHistory // ignore: cast_nullable_to_non_nullable
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
      required final Set<String> allBarcodeHistory,
      required this.countBarcodes,
      required this.maxIndexUnitInBox,
      required this.countBox,
      final String? $type})
      : _allBarcodeHistory = allBarcodeHistory,
        $type = $type ?? 'loaded';

  factory _$PalletsStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$PalletsStateLoadedFromJson(json);

  @override
  final ListPallets listPallets;
  final Set<String> _allBarcodeHistory;
  @override
  Set<String> get allBarcodeHistory {
    if (_allBarcodeHistory is EqualUnmodifiableSetView)
      return _allBarcodeHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_allBarcodeHistory);
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
    return 'PalletsState.loaded(listPallets: $listPallets, allBarcodeHistory: $allBarcodeHistory, countBarcodes: $countBarcodes, maxIndexUnitInBox: $maxIndexUnitInBox, countBox: $countBox)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalletsStateLoaded &&
            (identical(other.listPallets, listPallets) ||
                other.listPallets == listPallets) &&
            const DeepCollectionEquality()
                .equals(other._allBarcodeHistory, _allBarcodeHistory) &&
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
      const DeepCollectionEquality().hash(_allBarcodeHistory),
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
            Set<String> allBarcodeHistory,
            int countBarcodes,
            int maxIndexUnitInBox,
            int countBox)
        loaded,
    required TResult Function(String? errorText) error,
  }) {
    return loaded(listPallets, allBarcodeHistory, countBarcodes,
        maxIndexUnitInBox, countBox);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ListPallets listPallets, Set<String> allBarcodeHistory,
            int countBarcodes, int maxIndexUnitInBox, int countBox)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return loaded?.call(listPallets, allBarcodeHistory, countBarcodes,
        maxIndexUnitInBox, countBox);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ListPallets listPallets, Set<String> allBarcodeHistory,
            int countBarcodes, int maxIndexUnitInBox, int countBox)?
        loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(listPallets, allBarcodeHistory, countBarcodes,
          maxIndexUnitInBox, countBox);
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
      required final Set<String> allBarcodeHistory,
      required final int countBarcodes,
      required final int maxIndexUnitInBox,
      required final int countBox}) = _$PalletsStateLoaded;

  factory PalletsStateLoaded.fromJson(Map<String, dynamic> json) =
      _$PalletsStateLoaded.fromJson;

  ListPallets get listPallets;
  Set<String> get allBarcodeHistory;
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
            Set<String> allBarcodeHistory,
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
    TResult? Function(ListPallets listPallets, Set<String> allBarcodeHistory,
            int countBarcodes, int maxIndexUnitInBox, int countBox)?
        loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ListPallets listPallets, Set<String> allBarcodeHistory,
            int countBarcodes, int maxIndexUnitInBox, int countBox)?
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
