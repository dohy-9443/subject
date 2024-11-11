import 'package:flutter/material.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/maple_story_loading.dart';

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

class BlocHandler<T extends BaseState> extends StatelessWidget {
  final T state;
  final LoadingWidgetBuilder initial;
  final SuccessWidgetBuilder<T> success;
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
    } else if (state.isLoading) {
      return const MSLoading();
    } else if (state.isSuccess) {
      return success(context, state);
    } else if (state.isError) {
      return error(context, state);
    }
    return const SizedBox();
  }
}
