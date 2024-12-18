import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_event.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';
import 'package:maple_story_book/app/presentation/ranking/components/components.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_screen.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      : Refactor -> baekdonghyun.
///

@RoutePage()
class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      MSBlocConsumer<RankingBloc, RankingState, RankingSuccess>(
          initFunc: initFunction,
          bloc: context.read<RankingBloc>(),
          success: (context, successState) => RankingFragment(successState),
          errorPressed: () {},
          errorFullScreenPressed: () {});

  initFunction(BuildContext context) {
    context.read<RankingBloc>().add(
          GetRankingOverallEvent<RankingOverall>(
            date: DateTime.now().subtract(
              const Duration(days: 3),
            ),
          ),
        );
  }
}
