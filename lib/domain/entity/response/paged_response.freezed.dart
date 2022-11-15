// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paged_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PagedResponse<T> _$PagedResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PagedResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PagedResponse<T> {
  List<T> get data => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get countPage => throw _privateConstructorUsedError;
  bool get isNext => throw _privateConstructorUsedError;
  bool get isPrev => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagedResponseCopyWith<T, PagedResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedResponseCopyWith<T, $Res> {
  factory $PagedResponseCopyWith(
          PagedResponse<T> value, $Res Function(PagedResponse<T>) then) =
      _$PagedResponseCopyWithImpl<T, $Res, PagedResponse<T>>;
  @useResult
  $Res call(
      {List<T> data, int currentPage, int countPage, bool isNext, bool isPrev});
}

/// @nodoc
class _$PagedResponseCopyWithImpl<T, $Res, $Val extends PagedResponse<T>>
    implements $PagedResponseCopyWith<T, $Res> {
  _$PagedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? currentPage = null,
    Object? countPage = null,
    Object? isNext = null,
    Object? isPrev = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      countPage: null == countPage
          ? _value.countPage
          : countPage // ignore: cast_nullable_to_non_nullable
              as int,
      isNext: null == isNext
          ? _value.isNext
          : isNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrev: null == isPrev
          ? _value.isPrev
          : isPrev // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PagedResponseCopyWith<T, $Res>
    implements $PagedResponseCopyWith<T, $Res> {
  factory _$$_PagedResponseCopyWith(
          _$_PagedResponse<T> value, $Res Function(_$_PagedResponse<T>) then) =
      __$$_PagedResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> data, int currentPage, int countPage, bool isNext, bool isPrev});
}

/// @nodoc
class __$$_PagedResponseCopyWithImpl<T, $Res>
    extends _$PagedResponseCopyWithImpl<T, $Res, _$_PagedResponse<T>>
    implements _$$_PagedResponseCopyWith<T, $Res> {
  __$$_PagedResponseCopyWithImpl(
      _$_PagedResponse<T> _value, $Res Function(_$_PagedResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? currentPage = null,
    Object? countPage = null,
    Object? isNext = null,
    Object? isPrev = null,
  }) {
    return _then(_$_PagedResponse<T>(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      countPage: null == countPage
          ? _value.countPage
          : countPage // ignore: cast_nullable_to_non_nullable
              as int,
      isNext: null == isNext
          ? _value.isNext
          : isNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrev: null == isPrev
          ? _value.isPrev
          : isPrev // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_PagedResponse<T> implements _PagedResponse<T> {
  const _$_PagedResponse(
      {required final List<T> data,
      required this.currentPage,
      required this.countPage,
      required this.isNext,
      required this.isPrev})
      : _data = data;

  factory _$_PagedResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_PagedResponseFromJson(json, fromJsonT);

  final List<T> _data;
  @override
  List<T> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int currentPage;
  @override
  final int countPage;
  @override
  final bool isNext;
  @override
  final bool isPrev;

  @override
  String toString() {
    return 'PagedResponse<$T>(data: $data, currentPage: $currentPage, countPage: $countPage, isNext: $isNext, isPrev: $isPrev)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PagedResponse<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.countPage, countPage) ||
                other.countPage == countPage) &&
            (identical(other.isNext, isNext) || other.isNext == isNext) &&
            (identical(other.isPrev, isPrev) || other.isPrev == isPrev));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      currentPage,
      countPage,
      isNext,
      isPrev);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PagedResponseCopyWith<T, _$_PagedResponse<T>> get copyWith =>
      __$$_PagedResponseCopyWithImpl<T, _$_PagedResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_PagedResponseToJson<T>(this, toJsonT);
  }
}

abstract class _PagedResponse<T> implements PagedResponse<T> {
  const factory _PagedResponse(
      {required final List<T> data,
      required final int currentPage,
      required final int countPage,
      required final bool isNext,
      required final bool isPrev}) = _$_PagedResponse<T>;

  factory _PagedResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_PagedResponse<T>.fromJson;

  @override
  List<T> get data;
  @override
  int get currentPage;
  @override
  int get countPage;
  @override
  bool get isNext;
  @override
  bool get isPrev;
  @override
  @JsonKey(ignore: true)
  _$$_PagedResponseCopyWith<T, _$_PagedResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
