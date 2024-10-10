import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_event.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';
import 'package:maple_story_book/app/presentation/ranking/components/ranking_success_widget.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_screen.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      : Refactor -> baekdonghyun.
///

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) => MSBlocConsumer<RankingBloc, IRankingState>(
    initFunc: initFunction,
    bloc: context.read<RankingBloc>(),
    success: (context, successState) => const RankingSuccessWidget(),
    errorPressed: () {},
    errorFullScreenPressed: () {}
  );

  initFunction(BuildContext context) {
    context.read<RankingBloc>().add(GetRankingEvent<RankingTheSeed>(
        date: DateTime.now().subtract(const Duration(days: 3))));
    context.read<RankingBloc>().add(GetRankingEvent<RankingUnion>(
        date: DateTime.now().subtract(const Duration(days: 3))));
  }
}
