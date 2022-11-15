import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scb_app/core/hess_error.dart';

part 'response_wrap.freezed.dart';
part 'response_wrap.g.dart';

@Freezed(genericArgumentFactories: true)
class ResponseWrap<T> with _$ResponseWrap<T> {
  const factory ResponseWrap({
    required HessError resultCode,
    required T? data,
  }) = _ResponseWrap;

  factory ResponseWrap.fromJson(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ResponseWrapFromJson(json, fromJsonT);
}
