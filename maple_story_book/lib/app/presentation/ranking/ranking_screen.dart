import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_event.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';
import 'package:maple_story_book/app/presentation/ranking/components/ranking_success_widget.dart';
import 'package:maple_story_book/tool/component/component.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_screen.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      :
///

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  void initState() {
    context.read<RankingBloc>().add(GetRankingEvent<RankingTheSeed>(
        date: DateTime.now().subtract(const Duration(days: 3))));
    context.read<RankingBloc>().add(GetRankingEvent<RankingUnion>(
        date: DateTime.now().subtract(const Duration(days: 3))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RankingBloc, IRankingState>(
      listener: (BuildContext context, IRankingState state){
        if(state is RankingError) {
          mSErrorDialog(context, onPressed: (){}, error: state.error);
        }
      },
        builder: (BuildContext context, IRankingState state) {
      return BlocHandler<IRankingState>(
        state: state,
        initial: () => const MSLoading(),
        success: (context, successState) => const RankingSuccessWidget(),
        error: (context, error) => MSErrorFullScreen(
          error: error,
          onPressed: () {},
        ),
      );
    });
  }
}
