// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseWrap<T> _$$_ResponseWrapFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_ResponseWrap<T>(
      resultCode: $enumDecode(_$HessErrorEnumMap, json['resultCode']),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$$_ResponseWrapToJson<T>(
  _$_ResponseWrap<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'resultCode': _$HessErrorEnumMap[instance.resultCode]!,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

const _$HessErrorEnumMap = {
  HessError.success: 0,
  HessError.failed: 1,
  HessError.userNotFound: 2,
  HessError.passwordIncorrect: 3,
  HessError.userAlreadyExists: 4,
  HessError.fileException: 5,
  HessError.taskNotFound: 6,
  HessError.imageNotFound: 7,
  HessError.emailInvalid: 8,
  HessError.phoneInvalid: 9,
  HessError.emailAlreadyExists: 10,
  HessError.phoneAlreadyExists: 11,
  HessError.scuNotFound: 12,
  HessError.courseNotFound: 13,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
