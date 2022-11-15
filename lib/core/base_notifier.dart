import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/core/hess_error.dart';
import 'package:scb_app/core/ui_state.dart';
import 'package:scb_app/domain/entity/response/response_wrap.dart';
import 'package:scb_app/util.dart';

class BaseNotifier<T> extends StateNotifier<UIState<T>> {
  final Ref ref;

  BaseNotifier(this.ref) : super(const UIState.initial());

  Future<UIState<T>> request(Future<ResponseWrap<T>> Function() func) async {
    if (state.isLoading) return state;
    state = const UIState.loading();
    try {
      final res = await func();
      state = res.resultCode == HessError.success
          ? UIState.success(res.data as T)
          : UIState.error(res.resultCode);
    } on Error catch (e) {
      commonLog(e.toString());
      state = const UIState.error(HessError.failed);
    }
    return state;
  }

  void reset() {
    state = const UIState.initial();
  }
}
