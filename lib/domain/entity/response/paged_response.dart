import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_response.freezed.dart';
part 'paged_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PagedResponse<T> with _$PagedResponse<T> {
  const factory PagedResponse(
      {required List<T> data,
      required int currentPage,
      required int countPage,
      required bool isNext,
      required bool isPrev}) = _PagedResponse;

  factory PagedResponse.fromJson(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PagedResponseFromJson(json, fromJsonT);
}
