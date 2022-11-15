// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'response_wrap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseWrap<T> _$ResponseWrapFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ResponseWrap<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ResponseWrap<T> {
  HessError get resultCode => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseWrapCopyWith<T, ResponseWrap<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseWrapCopyWith<T, $Res> {
  factory $ResponseWrapCopyWith(
          ResponseWrap<T> value, $Res Function(ResponseWrap<T>) then) =
      _$ResponseWrapCopyWithImpl<T, $Res, ResponseWrap<T>>;
  @useResult
  $Res call({HessError resultCode, T? data});
}

/// @nodoc
class _$ResponseWrapCopyWithImpl<T, $Res, $Val extends ResponseWrap<T>>
    implements $ResponseWrapCopyWith<T, $Res> {
  _$ResponseWrapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCode = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      resultCode: null == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as HessError,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseWrapCopyWith<T, $Res>
    implements $ResponseWrapCopyWith<T, $Res> {
  factory _$$_ResponseWrapCopyWith(
          _$_ResponseWrap<T> value, $Res Function(_$_ResponseWrap<T>) then) =
      __$$_ResponseWrapCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({HessError resultCode, T? data});
}

/// @nodoc
class __$$_ResponseWrapCopyWithImpl<T, $Res>
    extends _$ResponseWrapCopyWithImpl<T, $Res, _$_ResponseWrap<T>>
    implements _$$_ResponseWrapCopyWith<T, $Res> {
  __$$_ResponseWrapCopyWithImpl(
      _$_ResponseWrap<T> _value, $Res Function(_$_ResponseWrap<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCode = null,
    Object? data = freezed,
  }) {
    return _then(_$_ResponseWrap<T>(
      resultCode: null == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as HessError,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_ResponseWrap<T> implements _ResponseWrap<T> {
  const _$_ResponseWrap({required this.resultCode, required this.data});

  factory _$_ResponseWrap.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ResponseWrapFromJson(json, fromJsonT);

  @override
  final HessError resultCode;
  @override
  final T? data;

  @override
  String toString() {
    return 'ResponseWrap<$T>(resultCode: $resultCode, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseWrap<T> &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, resultCode, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseWrapCopyWith<T, _$_ResponseWrap<T>> get copyWith =>
      __$$_ResponseWrapCopyWithImpl<T, _$_ResponseWrap<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_ResponseWrapToJson<T>(this, toJsonT);
  }
}

abstract class _ResponseWrap<T> implements ResponseWrap<T> {
  const factory _ResponseWrap(
      {required final HessError resultCode,
      required final T? data}) = _$_ResponseWrap<T>;

  factory _ResponseWrap.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ResponseWrap<T>.fromJson;

  @override
  HessError get resultCode;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseWrapCopyWith<T, _$_ResponseWrap<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
