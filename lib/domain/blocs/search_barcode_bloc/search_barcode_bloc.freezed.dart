// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_barcode_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SerachBarcodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListPallets listPallets, String barcode)
        searchBarcode,
    required TResult Function() clearInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListPallets listPallets, String barcode)? searchBarcode,
    TResult? Function()? clearInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListPallets listPallets, String barcode)? searchBarcode,
    TResult Function()? clearInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SerachBarcodeEventSerachBarcode value)
        searchBarcode,
    required TResult Function(SerachBarcodeEventClearInfo value) clearInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SerachBarcodeEventSerachBarcode value)? searchBarcode,
    TResult? Function(SerachBarcodeEventClearInfo value)? clearInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SerachBarcodeEventSerachBarcode value)? searchBarcode,
    TResult Function(SerachBarcodeEventClearInfo value)? clearInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SerachBarcodeEventCopyWith<$Res> {
  factory $SerachBarcodeEventCopyWith(
          SerachBarcodeEvent value, $Res Function(SerachBarcodeEvent) then) =
      _$SerachBarcodeEventCopyWithImpl<$Res, SerachBarcodeEvent>;
}

/// @nodoc
class _$SerachBarcodeEventCopyWithImpl<$Res, $Val extends SerachBarcodeEvent>
    implements $SerachBarcodeEventCopyWith<$Res> {
  _$SerachBarcodeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SerachBarcodeEventSerachBarcodeCopyWith<$Res> {
  factory _$$SerachBarcodeEventSerachBarcodeCopyWith(
          _$SerachBarcodeEventSerachBarcode value,
          $Res Function(_$SerachBarcodeEventSerachBarcode) then) =
      __$$SerachBarcodeEventSerachBarcodeCopyWithImpl<$Res>;
  @useResult
  $Res call({ListPallets listPallets, String barcode});

  $ListPalletsCopyWith<$Res> get listPallets;
}

/// @nodoc
class __$$SerachBarcodeEventSerachBarcodeCopyWithImpl<$Res>
    extends _$SerachBarcodeEventCopyWithImpl<$Res,
        _$SerachBarcodeEventSerachBarcode>
    implements _$$SerachBarcodeEventSerachBarcodeCopyWith<$Res> {
  __$$SerachBarcodeEventSerachBarcodeCopyWithImpl(
      _$SerachBarcodeEventSerachBarcode _value,
      $Res Function(_$SerachBarcodeEventSerachBarcode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listPallets = null,
    Object? barcode = null,
  }) {
    return _then(_$SerachBarcodeEventSerachBarcode(
      listPallets: null == listPallets
          ? _value.listPallets
          : listPallets // ignore: cast_nullable_to_non_nullable
              as ListPallets,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$SerachBarcodeEventSerachBarcode
    implements SerachBarcodeEventSerachBarcode {
  const _$SerachBarcodeEventSerachBarcode(
      {required this.listPallets, required this.barcode});

  @override
  final ListPallets listPallets;
  @override
  final String barcode;

  @override
  String toString() {
    return 'SerachBarcodeEvent.searchBarcode(listPallets: $listPallets, barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SerachBarcodeEventSerachBarcode &&
            (identical(other.listPallets, listPallets) ||
                other.listPallets == listPallets) &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, listPallets, barcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SerachBarcodeEventSerachBarcodeCopyWith<_$SerachBarcodeEventSerachBarcode>
      get copyWith => __$$SerachBarcodeEventSerachBarcodeCopyWithImpl<
          _$SerachBarcodeEventSerachBarcode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListPallets listPallets, String barcode)
        searchBarcode,
    required TResult Function() clearInfo,
  }) {
    return searchBarcode(listPallets, barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListPallets listPallets, String barcode)? searchBarcode,
    TResult? Function()? clearInfo,
  }) {
    return searchBarcode?.call(listPallets, barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListPallets listPallets, String barcode)? searchBarcode,
    TResult Function()? clearInfo,
    required TResult orElse(),
  }) {
    if (searchBarcode != null) {
      return searchBarcode(listPallets, barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SerachBarcodeEventSerachBarcode value)
        searchBarcode,
    required TResult Function(SerachBarcodeEventClearInfo value) clearInfo,
  }) {
    return searchBarcode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SerachBarcodeEventSerachBarcode value)? searchBarcode,
    TResult? Function(SerachBarcodeEventClearInfo value)? clearInfo,
  }) {
    return searchBarcode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SerachBarcodeEventSerachBarcode value)? searchBarcode,
    TResult Function(SerachBarcodeEventClearInfo value)? clearInfo,
    required TResult orElse(),
  }) {
    if (searchBarcode != null) {
      return searchBarcode(this);
    }
    return orElse();
  }
}

abstract class SerachBarcodeEventSerachBarcode implements SerachBarcodeEvent {
  const factory SerachBarcodeEventSerachBarcode(
      {required final ListPallets listPallets,
      required final String barcode}) = _$SerachBarcodeEventSerachBarcode;

  ListPallets get listPallets;
  String get barcode;
  @JsonKey(ignore: true)
  _$$SerachBarcodeEventSerachBarcodeCopyWith<_$SerachBarcodeEventSerachBarcode>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SerachBarcodeEventClearInfoCopyWith<$Res> {
  factory _$$SerachBarcodeEventClearInfoCopyWith(
          _$SerachBarcodeEventClearInfo value,
          $Res Function(_$SerachBarcodeEventClearInfo) then) =
      __$$SerachBarcodeEventClearInfoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SerachBarcodeEventClearInfoCopyWithImpl<$Res>
    extends _$SerachBarcodeEventCopyWithImpl<$Res,
        _$SerachBarcodeEventClearInfo>
    implements _$$SerachBarcodeEventClearInfoCopyWith<$Res> {
  __$$SerachBarcodeEventClearInfoCopyWithImpl(
      _$SerachBarcodeEventClearInfo _value,
      $Res Function(_$SerachBarcodeEventClearInfo) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SerachBarcodeEventClearInfo implements SerachBarcodeEventClearInfo {
  const _$SerachBarcodeEventClearInfo();

  @override
  String toString() {
    return 'SerachBarcodeEvent.clearInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SerachBarcodeEventClearInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListPallets listPallets, String barcode)
        searchBarcode,
    required TResult Function() clearInfo,
  }) {
    return clearInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListPallets listPallets, String barcode)? searchBarcode,
    TResult? Function()? clearInfo,
  }) {
    return clearInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListPallets listPallets, String barcode)? searchBarcode,
    TResult Function()? clearInfo,
    required TResult orElse(),
  }) {
    if (clearInfo != null) {
      return clearInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SerachBarcodeEventSerachBarcode value)
        searchBarcode,
    required TResult Function(SerachBarcodeEventClearInfo value) clearInfo,
  }) {
    return clearInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SerachBarcodeEventSerachBarcode value)? searchBarcode,
    TResult? Function(SerachBarcodeEventClearInfo value)? clearInfo,
  }) {
    return clearInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SerachBarcodeEventSerachBarcode value)? searchBarcode,
    TResult Function(SerachBarcodeEventClearInfo value)? clearInfo,
    required TResult orElse(),
  }) {
    if (clearInfo != null) {
      return clearInfo(this);
    }
    return orElse();
  }
}

abstract class SerachBarcodeEventClearInfo implements SerachBarcodeEvent {
  const factory SerachBarcodeEventClearInfo() = _$SerachBarcodeEventClearInfo;
}

SearchBarcodeState _$SearchBarcodeStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'init':
      return SearchBarcodeStateInit.fromJson(json);
    case 'loaded':
      return SearchBarcodeStateLoaded.fromJson(json);
    case 'error':
      return SearchBarcodeStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SearchBarcodeState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SearchBarcodeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? infoAboutBarcode) loaded,
    required TResult Function(String? errorText) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? infoAboutBarcode)? loaded,
    TResult? Function(String? errorText)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? infoAboutBarcode)? loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchBarcodeStateInit value) init,
    required TResult Function(SearchBarcodeStateLoaded value) loaded,
    required TResult Function(SearchBarcodeStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchBarcodeStateInit value)? init,
    TResult? Function(SearchBarcodeStateLoaded value)? loaded,
    TResult? Function(SearchBarcodeStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchBarcodeStateInit value)? init,
    TResult Function(SearchBarcodeStateLoaded value)? loaded,
    TResult Function(SearchBarcodeStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBarcodeStateCopyWith<$Res> {
  factory $SearchBarcodeStateCopyWith(
          SearchBarcodeState value, $Res Function(SearchBarcodeState) then) =
      _$SearchBarcodeStateCopyWithImpl<$Res, SearchBarcodeState>;
}

/// @nodoc
class _$SearchBarcodeStateCopyWithImpl<$Res, $Val extends SearchBarcodeState>
    implements $SearchBarcodeStateCopyWith<$Res> {
  _$SearchBarcodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchBarcodeStateInitCopyWith<$Res> {
  factory _$$SearchBarcodeStateInitCopyWith(_$SearchBarcodeStateInit value,
          $Res Function(_$SearchBarcodeStateInit) then) =
      __$$SearchBarcodeStateInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchBarcodeStateInitCopyWithImpl<$Res>
    extends _$SearchBarcodeStateCopyWithImpl<$Res, _$SearchBarcodeStateInit>
    implements _$$SearchBarcodeStateInitCopyWith<$Res> {
  __$$SearchBarcodeStateInitCopyWithImpl(_$SearchBarcodeStateInit _value,
      $Res Function(_$SearchBarcodeStateInit) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SearchBarcodeStateInit implements SearchBarcodeStateInit {
  const _$SearchBarcodeStateInit({final String? $type})
      : $type = $type ?? 'init';

  factory _$SearchBarcodeStateInit.fromJson(Map<String, dynamic> json) =>
      _$$SearchBarcodeStateInitFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchBarcodeState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchBarcodeStateInit);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? infoAboutBarcode) loaded,
    required TResult Function(String? errorText) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? infoAboutBarcode)? loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? infoAboutBarcode)? loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchBarcodeStateInit value) init,
    required TResult Function(SearchBarcodeStateLoaded value) loaded,
    required TResult Function(SearchBarcodeStateError value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchBarcodeStateInit value)? init,
    TResult? Function(SearchBarcodeStateLoaded value)? loaded,
    TResult? Function(SearchBarcodeStateError value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchBarcodeStateInit value)? init,
    TResult Function(SearchBarcodeStateLoaded value)? loaded,
    TResult Function(SearchBarcodeStateError value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchBarcodeStateInitToJson(
      this,
    );
  }
}

abstract class SearchBarcodeStateInit implements SearchBarcodeState {
  const factory SearchBarcodeStateInit() = _$SearchBarcodeStateInit;

  factory SearchBarcodeStateInit.fromJson(Map<String, dynamic> json) =
      _$SearchBarcodeStateInit.fromJson;
}

/// @nodoc
abstract class _$$SearchBarcodeStateLoadedCopyWith<$Res> {
  factory _$$SearchBarcodeStateLoadedCopyWith(_$SearchBarcodeStateLoaded value,
          $Res Function(_$SearchBarcodeStateLoaded) then) =
      __$$SearchBarcodeStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? infoAboutBarcode});
}

/// @nodoc
class __$$SearchBarcodeStateLoadedCopyWithImpl<$Res>
    extends _$SearchBarcodeStateCopyWithImpl<$Res, _$SearchBarcodeStateLoaded>
    implements _$$SearchBarcodeStateLoadedCopyWith<$Res> {
  __$$SearchBarcodeStateLoadedCopyWithImpl(_$SearchBarcodeStateLoaded _value,
      $Res Function(_$SearchBarcodeStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? infoAboutBarcode = freezed,
  }) {
    return _then(_$SearchBarcodeStateLoaded(
      infoAboutBarcode: freezed == infoAboutBarcode
          ? _value.infoAboutBarcode
          : infoAboutBarcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchBarcodeStateLoaded implements SearchBarcodeStateLoaded {
  const _$SearchBarcodeStateLoaded({this.infoAboutBarcode, final String? $type})
      : $type = $type ?? 'loaded';

  factory _$SearchBarcodeStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$SearchBarcodeStateLoadedFromJson(json);

  @override
  final String? infoAboutBarcode;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchBarcodeState.loaded(infoAboutBarcode: $infoAboutBarcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchBarcodeStateLoaded &&
            (identical(other.infoAboutBarcode, infoAboutBarcode) ||
                other.infoAboutBarcode == infoAboutBarcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, infoAboutBarcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchBarcodeStateLoadedCopyWith<_$SearchBarcodeStateLoaded>
      get copyWith =>
          __$$SearchBarcodeStateLoadedCopyWithImpl<_$SearchBarcodeStateLoaded>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? infoAboutBarcode) loaded,
    required TResult Function(String? errorText) error,
  }) {
    return loaded(infoAboutBarcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? infoAboutBarcode)? loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return loaded?.call(infoAboutBarcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? infoAboutBarcode)? loaded,
    TResult Function(String? errorText)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(infoAboutBarcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchBarcodeStateInit value) init,
    required TResult Function(SearchBarcodeStateLoaded value) loaded,
    required TResult Function(SearchBarcodeStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchBarcodeStateInit value)? init,
    TResult? Function(SearchBarcodeStateLoaded value)? loaded,
    TResult? Function(SearchBarcodeStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchBarcodeStateInit value)? init,
    TResult Function(SearchBarcodeStateLoaded value)? loaded,
    TResult Function(SearchBarcodeStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchBarcodeStateLoadedToJson(
      this,
    );
  }
}

abstract class SearchBarcodeStateLoaded implements SearchBarcodeState {
  const factory SearchBarcodeStateLoaded({final String? infoAboutBarcode}) =
      _$SearchBarcodeStateLoaded;

  factory SearchBarcodeStateLoaded.fromJson(Map<String, dynamic> json) =
      _$SearchBarcodeStateLoaded.fromJson;

  String? get infoAboutBarcode;
  @JsonKey(ignore: true)
  _$$SearchBarcodeStateLoadedCopyWith<_$SearchBarcodeStateLoaded>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchBarcodeStateErrorCopyWith<$Res> {
  factory _$$SearchBarcodeStateErrorCopyWith(_$SearchBarcodeStateError value,
          $Res Function(_$SearchBarcodeStateError) then) =
      __$$SearchBarcodeStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorText});
}

/// @nodoc
class __$$SearchBarcodeStateErrorCopyWithImpl<$Res>
    extends _$SearchBarcodeStateCopyWithImpl<$Res, _$SearchBarcodeStateError>
    implements _$$SearchBarcodeStateErrorCopyWith<$Res> {
  __$$SearchBarcodeStateErrorCopyWithImpl(_$SearchBarcodeStateError _value,
      $Res Function(_$SearchBarcodeStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_$SearchBarcodeStateError(
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchBarcodeStateError implements SearchBarcodeStateError {
  const _$SearchBarcodeStateError({this.errorText, final String? $type})
      : $type = $type ?? 'error';

  factory _$SearchBarcodeStateError.fromJson(Map<String, dynamic> json) =>
      _$$SearchBarcodeStateErrorFromJson(json);

  @override
  final String? errorText;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchBarcodeState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchBarcodeStateError &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchBarcodeStateErrorCopyWith<_$SearchBarcodeStateError> get copyWith =>
      __$$SearchBarcodeStateErrorCopyWithImpl<_$SearchBarcodeStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? infoAboutBarcode) loaded,
    required TResult Function(String? errorText) error,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? infoAboutBarcode)? loaded,
    TResult? Function(String? errorText)? error,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? infoAboutBarcode)? loaded,
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
    required TResult Function(SearchBarcodeStateInit value) init,
    required TResult Function(SearchBarcodeStateLoaded value) loaded,
    required TResult Function(SearchBarcodeStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchBarcodeStateInit value)? init,
    TResult? Function(SearchBarcodeStateLoaded value)? loaded,
    TResult? Function(SearchBarcodeStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchBarcodeStateInit value)? init,
    TResult Function(SearchBarcodeStateLoaded value)? loaded,
    TResult Function(SearchBarcodeStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchBarcodeStateErrorToJson(
      this,
    );
  }
}

abstract class SearchBarcodeStateError implements SearchBarcodeState {
  const factory SearchBarcodeStateError({final String? errorText}) =
      _$SearchBarcodeStateError;

  factory SearchBarcodeStateError.fromJson(Map<String, dynamic> json) =
      _$SearchBarcodeStateError.fromJson;

  String? get errorText;
  @JsonKey(ignore: true)
  _$$SearchBarcodeStateErrorCopyWith<_$SearchBarcodeStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
