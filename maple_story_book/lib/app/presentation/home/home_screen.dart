import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/components/home_bloc_consumer.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_event.dart';
import 'package:maple_story_book/app/presentation/search_favorite_list/search_favorite_list_screen.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_screen.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      :
///

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // context.read<HomeBloc>().add(GetHomeEvent<BasicInfo>("36c54981582f63ef732f51a1216299d2"));
    context.read<RankingBloc>().add(GetRankingStudioEvent<RankingStudio>(
      DateTime.now().subtract(const Duration(days: 2)),
      '루나',
      1,
      '나이트워커',
      '36c54981582f63ef732f51a1216299d2',
      1
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Center();
  }
}

