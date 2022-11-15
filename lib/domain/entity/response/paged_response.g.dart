// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PagedResponse<T> _$$_PagedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_PagedResponse<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      currentPage: json['currentPage'] as int,
      countPage: json['countPage'] as int,
      isNext: json['isNext'] as bool,
      isPrev: json['isPrev'] as bool,
    );

Map<String, dynamic> _$$_PagedResponseToJson<T>(
  _$_PagedResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'currentPage': instance.currentPage,
      'countPage': instance.countPage,
      'isNext': instance.isNext,
      'isPrev': instance.isPrev,
    };
