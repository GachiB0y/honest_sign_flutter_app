// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListPallets _$ListPalletsFromJson(Map<String, dynamic> json) {
  return _ListPallets.fromJson(json);
}

/// @nodoc
mixin _$ListPallets {
  List<ModelsPallet> get listModelsPallet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListPalletsCopyWith<ListPallets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListPalletsCopyWith<$Res> {
  factory $ListPalletsCopyWith(
          ListPallets value, $Res Function(ListPallets) then) =
      _$ListPalletsCopyWithImpl<$Res, ListPallets>;
  @useResult
  $Res call({List<ModelsPallet> listModelsPallet});
}

/// @nodoc
class _$ListPalletsCopyWithImpl<$Res, $Val extends ListPallets>
    implements $ListPalletsCopyWith<$Res> {
  _$ListPalletsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listModelsPallet = null,
  }) {
    return _then(_value.copyWith(
      listModelsPallet: null == listModelsPallet
          ? _value.listModelsPallet
          : listModelsPallet // ignore: cast_nullable_to_non_nullable
              as List<ModelsPallet>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListPalletsCopyWith<$Res>
    implements $ListPalletsCopyWith<$Res> {
  factory _$$_ListPalletsCopyWith(
          _$_ListPallets value, $Res Function(_$_ListPallets) then) =
      __$$_ListPalletsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ModelsPallet> listModelsPallet});
}

/// @nodoc
class __$$_ListPalletsCopyWithImpl<$Res>
    extends _$ListPalletsCopyWithImpl<$Res, _$_ListPallets>
    implements _$$_ListPalletsCopyWith<$Res> {
  __$$_ListPalletsCopyWithImpl(
      _$_ListPallets _value, $Res Function(_$_ListPallets) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listModelsPallet = null,
  }) {
    return _then(_$_ListPallets(
      listModelsPallet: null == listModelsPallet
          ? _value._listModelsPallet
          : listModelsPallet // ignore: cast_nullable_to_non_nullable
              as List<ModelsPallet>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListPallets implements _ListPallets {
  const _$_ListPallets({required final List<ModelsPallet> listModelsPallet})
      : _listModelsPallet = listModelsPallet;

  factory _$_ListPallets.fromJson(Map<String, dynamic> json) =>
      _$$_ListPalletsFromJson(json);

  final List<ModelsPallet> _listModelsPallet;
  @override
  List<ModelsPallet> get listModelsPallet {
    if (_listModelsPallet is EqualUnmodifiableListView)
      return _listModelsPallet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listModelsPallet);
  }

  @override
  String toString() {
    return 'ListPallets(listModelsPallet: $listModelsPallet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListPallets &&
            const DeepCollectionEquality()
                .equals(other._listModelsPallet, _listModelsPallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listModelsPallet));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListPalletsCopyWith<_$_ListPallets> get copyWith =>
      __$$_ListPalletsCopyWithImpl<_$_ListPallets>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListPalletsToJson(
      this,
    );
  }
}

abstract class _ListPallets implements ListPallets {
  const factory _ListPallets(
      {required final List<ModelsPallet> listModelsPallet}) = _$_ListPallets;

  factory _ListPallets.fromJson(Map<String, dynamic> json) =
      _$_ListPallets.fromJson;

  @override
  List<ModelsPallet> get listModelsPallet;
  @override
  @JsonKey(ignore: true)
  _$$_ListPalletsCopyWith<_$_ListPallets> get copyWith =>
      throw _privateConstructorUsedError;
}

ModelsPallet _$ModelsPalletFromJson(Map<String, dynamic> json) {
  return _ModelsPallet.fromJson(json);
}

/// @nodoc
mixin _$ModelsPallet {
  String get barcode => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get dateRelease => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<Box> get boxes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelsPalletCopyWith<ModelsPallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelsPalletCopyWith<$Res> {
  factory $ModelsPalletCopyWith(
          ModelsPallet value, $Res Function(ModelsPallet) then) =
      _$ModelsPalletCopyWithImpl<$Res, ModelsPallet>;
  @useResult
  $Res call(
      {String barcode,
      String date,
      String dateRelease,
      String status,
      List<Box> boxes});
}

/// @nodoc
class _$ModelsPalletCopyWithImpl<$Res, $Val extends ModelsPallet>
    implements $ModelsPalletCopyWith<$Res> {
  _$ModelsPalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? date = null,
    Object? dateRelease = null,
    Object? status = null,
    Object? boxes = null,
  }) {
    return _then(_value.copyWith(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dateRelease: null == dateRelease
          ? _value.dateRelease
          : dateRelease // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      boxes: null == boxes
          ? _value.boxes
          : boxes // ignore: cast_nullable_to_non_nullable
              as List<Box>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ModelsPalletCopyWith<$Res>
    implements $ModelsPalletCopyWith<$Res> {
  factory _$$_ModelsPalletCopyWith(
          _$_ModelsPallet value, $Res Function(_$_ModelsPallet) then) =
      __$$_ModelsPalletCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String barcode,
      String date,
      String dateRelease,
      String status,
      List<Box> boxes});
}

/// @nodoc
class __$$_ModelsPalletCopyWithImpl<$Res>
    extends _$ModelsPalletCopyWithImpl<$Res, _$_ModelsPallet>
    implements _$$_ModelsPalletCopyWith<$Res> {
  __$$_ModelsPalletCopyWithImpl(
      _$_ModelsPallet _value, $Res Function(_$_ModelsPallet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? date = null,
    Object? dateRelease = null,
    Object? status = null,
    Object? boxes = null,
  }) {
    return _then(_$_ModelsPallet(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dateRelease: null == dateRelease
          ? _value.dateRelease
          : dateRelease // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      boxes: null == boxes
          ? _value._boxes
          : boxes // ignore: cast_nullable_to_non_nullable
              as List<Box>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModelsPallet implements _ModelsPallet {
  const _$_ModelsPallet(
      {required this.barcode,
      required this.date,
      required this.dateRelease,
      required this.status,
      required final List<Box> boxes})
      : _boxes = boxes;

  factory _$_ModelsPallet.fromJson(Map<String, dynamic> json) =>
      _$$_ModelsPalletFromJson(json);

  @override
  final String barcode;
  @override
  final String date;
  @override
  final String dateRelease;
  @override
  final String status;
  final List<Box> _boxes;
  @override
  List<Box> get boxes {
    if (_boxes is EqualUnmodifiableListView) return _boxes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boxes);
  }

  @override
  String toString() {
    return 'ModelsPallet(barcode: $barcode, date: $date, dateRelease: $dateRelease, status: $status, boxes: $boxes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModelsPallet &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateRelease, dateRelease) ||
                other.dateRelease == dateRelease) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._boxes, _boxes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, barcode, date, dateRelease,
      status, const DeepCollectionEquality().hash(_boxes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModelsPalletCopyWith<_$_ModelsPallet> get copyWith =>
      __$$_ModelsPalletCopyWithImpl<_$_ModelsPallet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModelsPalletToJson(
      this,
    );
  }
}

abstract class _ModelsPallet implements ModelsPallet {
  const factory _ModelsPallet(
      {required final String barcode,
      required final String date,
      required final String dateRelease,
      required final String status,
      required final List<Box> boxes}) = _$_ModelsPallet;

  factory _ModelsPallet.fromJson(Map<String, dynamic> json) =
      _$_ModelsPallet.fromJson;

  @override
  String get barcode;
  @override
  String get date;
  @override
  String get dateRelease;
  @override
  String get status;
  @override
  List<Box> get boxes;
  @override
  @JsonKey(ignore: true)
  _$$_ModelsPalletCopyWith<_$_ModelsPallet> get copyWith =>
      throw _privateConstructorUsedError;
}

Box _$BoxFromJson(Map<String, dynamic> json) {
  return _Box.fromJson(json);
}

/// @nodoc
mixin _$Box {
  String get barcode => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoxCopyWith<Box> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoxCopyWith<$Res> {
  factory $BoxCopyWith(Box value, $Res Function(Box) then) =
      _$BoxCopyWithImpl<$Res, Box>;
  @useResult
  $Res call({String barcode, String date, List<Item> items});
}

/// @nodoc
class _$BoxCopyWithImpl<$Res, $Val extends Box> implements $BoxCopyWith<$Res> {
  _$BoxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? date = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BoxCopyWith<$Res> implements $BoxCopyWith<$Res> {
  factory _$$_BoxCopyWith(_$_Box value, $Res Function(_$_Box) then) =
      __$$_BoxCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String barcode, String date, List<Item> items});
}

/// @nodoc
class __$$_BoxCopyWithImpl<$Res> extends _$BoxCopyWithImpl<$Res, _$_Box>
    implements _$$_BoxCopyWith<$Res> {
  __$$_BoxCopyWithImpl(_$_Box _value, $Res Function(_$_Box) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? date = null,
    Object? items = null,
  }) {
    return _then(_$_Box(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Box implements _Box {
  const _$_Box(
      {required this.barcode,
      required this.date,
      required final List<Item> items})
      : _items = items;

  factory _$_Box.fromJson(Map<String, dynamic> json) => _$$_BoxFromJson(json);

  @override
  final String barcode;
  @override
  final String date;
  final List<Item> _items;
  @override
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Box(barcode: $barcode, date: $date, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Box &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, barcode, date, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoxCopyWith<_$_Box> get copyWith =>
      __$$_BoxCopyWithImpl<_$_Box>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoxToJson(
      this,
    );
  }
}

abstract class _Box implements Box {
  const factory _Box(
      {required final String barcode,
      required final String date,
      required final List<Item> items}) = _$_Box;

  factory _Box.fromJson(Map<String, dynamic> json) = _$_Box.fromJson;

  @override
  String get barcode;
  @override
  String get date;
  @override
  List<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$$_BoxCopyWith<_$_Box> get copyWith => throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get barcode => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call({String barcode, String date});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String barcode, String date});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? date = null,
  }) {
    return _then(_$_Item(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item({required this.barcode, required this.date});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String barcode;
  @override
  final String date;

  @override
  String toString() {
    return 'Item(barcode: $barcode, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, barcode, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required final String barcode, required final String date}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get barcode;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
