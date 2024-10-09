import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';

typedef SuccessWidgetBuilder<T> = Widget Function(BuildContext context, T state);
typedef ErrorWidgetBuilder = Widget Function(BuildContext context, dynamic error);
typedef LoadingWidgetBuilder = Widget Function();

class BlocHandler<T extends IBaseState> extends StatelessWidget {
  final T state;
  final LoadingWidgetBuilder initial;
  final SuccessWidgetBuilder<T> success;
  final ErrorWidgetBuilder error;

  const BlocHandler({
    super.key,
    required this.state,
    required this.initial,
    required this.success,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isInitial) {
      return initial();
    } else if (state.isError) {
      final errorState = state as BaseErrorState;
      return error(context, errorState.error);
    } else if (state.isSuccess) {
      return success(context, state);
    } else {
      return const SizedBox();
    }
  }
}
