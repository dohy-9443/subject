import 'package:flutter/material.dart';
import 'package:maple_story_book/core/extension/null_check_extension.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : base_state_handler.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 9..
/// Description      : Refactor -> baekdonghyun.
///

typedef SuccessWidgetBuilder<TSuccess> = Widget Function(BuildContext context, TSuccess state);
typedef ErrorWidgetBuilder = Widget Function(BuildContext context, dynamic error);
typedef LoadingWidgetBuilder = Widget Function();

class BlocHandler<T extends IBaseState, TSuccess extends BaseSuccessState> extends StatelessWidget {
  final T state;
  final LoadingWidgetBuilder initial;
  final SuccessWidgetBuilder<TSuccess> success;
  final Widget successEmpty;
  final ErrorWidgetBuilder error;

  const BlocHandler({
    super.key,
    required this.state,
    required this.initial,
    required this.success,
    required this.successEmpty,
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
      if(state.hasData) {
        return success(context, state as TSuccess);
      } else {
        return successEmpty;
      }
    } else {
      return const SizedBox();
    }
  }
}
