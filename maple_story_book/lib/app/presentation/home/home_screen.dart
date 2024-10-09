import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/components/home_bloc_consumer.dart';

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
    context.read<HomeBloc>().add(GetHomeEvent<BasicInfo>(ocid: "36c54981582f63ef732f51a1216299d2"));
    // context.read<RankingBloc>().add(GetRankingStudioEvent<RankingStudio>(
    //   date: DateTime.now().subtract(const Duration(days: 2)),
    //   difficulty: 1,
    // ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => HomeBlocConsumer();
}

