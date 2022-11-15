import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
class UIState<T> with _$UIState {
  const factory UIState.initial() = _Initial;
  const factory UIState.loading() = _Loading;
  const factory UIState.success(T data) = _Data;
  const factory UIState.error(dynamic error) = _Error;
}

extension UIStateExtension<T> on UIState<T> {
  bool get isLoading => this is _Loading;
  bool get isInitial => this is _Initial;
  bool get isSuccess => this is _Data;
  bool get isError => this is _Error;
  dynamic get error => isError ? (this as _Error).error : null;
  T? get data => isSuccess ? (this as _Data<T>).data : null;
}
