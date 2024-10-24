import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/presentation/global/global_bloc.dart';
import 'package:maple_story_book/app/presentation/global/global_state.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/component.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_bloc_consumer.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 10..
/// Description      :
///

class MSBlocConsumer<B extends BlocBase<S>, S extends IBaseState, SSuccess extends BaseSuccessState> extends StatefulWidget {
  final Function(BuildContext context) initFunc;

  final B bloc;
  final BlocWidgetListener<S>? listener;
  final BlocWidgetBuilder<S>? builder;

  final Widget Function()? initial;
  final Widget Function(BuildContext context, SSuccess state) success;
  final Widget? successEmpty;

  final VoidCallback errorPressed;
  final VoidCallback errorFullScreenPressed;

  const MSBlocConsumer({
    super.key,
    required this.initFunc,
    required this.bloc,
    this.listener,
    this.builder,
    this.initial,
    required this.success,
    this.successEmpty,
    required this.errorPressed,
    required this.errorFullScreenPressed,
  });

  @override
  State<MSBlocConsumer<B, S, SSuccess>> createState() => _MSBlocConsumerState<B, S, SSuccess>();
}

class _MSBlocConsumerState<B extends BlocBase<S>, S extends IBaseState, SSuccess extends BaseSuccessState> extends State<MSBlocConsumer<B, S, SSuccess>> {
  @override
  void initState() {
    widget.initFunc(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<GlobalBloc, IGlobalState>(
    bloc: context.read<GlobalBloc>(),
    builder: (globalContext, globalState) {
      return BlocConsumer<B, S>(
            bloc: widget.bloc,
            listener: widget.listener ??
                (context, state) {
                  if (state is BaseErrorState) {
                    mSErrorDialog(context, onPressed: widget.errorPressed, error: state.error);
                  }
                },
            builder: (context, state) {
              return BlocHandler<S, SSuccess>(
                state: state,
                initial: () => const MSLoading(),
                success: widget.success,
                successEmpty: widget.successEmpty ?? MSEmpty(),
                error: (context, error) => MSErrorFullScreen(
                  error: error,
                  onPressed: widget.errorFullScreenPressed,
                ),
              );
            },
          );
    }
  );
}
