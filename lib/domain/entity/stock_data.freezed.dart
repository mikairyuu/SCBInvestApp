// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StockData _$StockDataFromJson(Map<String, dynamic> json) {
  return _StockData.fromJson(json);
}

/// @nodoc
mixin _$StockData {
  String get name => throw _privateConstructorUsedError;
  String get pricePerStock => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  double get change => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockDataCopyWith<StockData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockDataCopyWith<$Res> {
  factory $StockDataCopyWith(StockData value, $Res Function(StockData) then) =
      _$StockDataCopyWithImpl<$Res, StockData>;
  @useResult
  $Res call(
      {String name,
      String pricePerStock,
      String price,
      double change,
      String imageURL});
}

/// @nodoc
class _$StockDataCopyWithImpl<$Res, $Val extends StockData>
    implements $StockDataCopyWith<$Res> {
  _$StockDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? pricePerStock = null,
    Object? price = null,
    Object? change = null,
    Object? imageURL = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerStock: null == pricePerStock
          ? _value.pricePerStock
          : pricePerStock // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StockDataCopyWith<$Res> implements $StockDataCopyWith<$Res> {
  factory _$$_StockDataCopyWith(
          _$_StockData value, $Res Function(_$_StockData) then) =
      __$$_StockDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String pricePerStock,
      String price,
      double change,
      String imageURL});
}

/// @nodoc
class __$$_StockDataCopyWithImpl<$Res>
    extends _$StockDataCopyWithImpl<$Res, _$_StockData>
    implements _$$_StockDataCopyWith<$Res> {
  __$$_StockDataCopyWithImpl(
      _$_StockData _value, $Res Function(_$_StockData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? pricePerStock = null,
    Object? price = null,
    Object? change = null,
    Object? imageURL = null,
  }) {
    return _then(_$_StockData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerStock: null == pricePerStock
          ? _value.pricePerStock
          : pricePerStock // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StockData implements _StockData {
  const _$_StockData(
      {required this.name,
      required this.pricePerStock,
      required this.price,
      required this.change,
      required this.imageURL});

  factory _$_StockData.fromJson(Map<String, dynamic> json) =>
      _$$_StockDataFromJson(json);

  @override
  final String name;
  @override
  final String pricePerStock;
  @override
  final String price;
  @override
  final double change;
  @override
  final String imageURL;

  @override
  String toString() {
    return 'StockData(name: $name, pricePerStock: $pricePerStock, price: $price, change: $change, imageURL: $imageURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pricePerStock, pricePerStock) ||
                other.pricePerStock == pricePerStock) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.change, change) || other.change == change) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, pricePerStock, price, change, imageURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StockDataCopyWith<_$_StockData> get copyWith =>
      __$$_StockDataCopyWithImpl<_$_StockData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StockDataToJson(
      this,
    );
  }
}

abstract class _StockData implements StockData {
  const factory _StockData(
      {required final String name,
      required final String pricePerStock,
      required final String price,
      required final double change,
      required final String imageURL}) = _$_StockData;

  factory _StockData.fromJson(Map<String, dynamic> json) =
      _$_StockData.fromJson;

  @override
  String get name;
  @override
  String get pricePerStock;
  @override
  String get price;
  @override
  double get change;
  @override
  String get imageURL;
  @override
  @JsonKey(ignore: true)
  _$$_StockDataCopyWith<_$_StockData> get copyWith =>
      throw _privateConstructorUsedError;
}
