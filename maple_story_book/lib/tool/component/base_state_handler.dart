import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';

typedef SuccessWidgetBuilder<S> = Widget Function(BuildContext context, S state);
typedef ErrorWidgetBuilder = Widget Function(BuildContext context, dynamic error);
typedef LoadingWidgetBuilder = Widget Function();

class BaseStateHandler<S extends IBaseState> extends StatelessWidget {
  final S state;
  final SuccessWidgetBuilder<S> onSuccess;
  final ErrorWidgetBuilder onError;
  final LoadingWidgetBuilder onLoading;

  const BaseStateHandler({
    super.key,
    required this.state,
    required this.onSuccess,
    required this.onError,
    required this.onLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isInitial) {
      return onLoading();
    } else if (state.isError) {
      final errorState = state as BaseErrorState;
      return onError(context, errorState.error);
    } else if (state.isSuccess) {
      return onSuccess(context, state);
    } else {
      return const SizedBox();
    }
  }
}
