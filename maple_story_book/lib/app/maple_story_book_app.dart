import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/di/di_setup.dart';
import 'package:maple_story_book/app/presentation/all/guild/bloc/guild_bloc.dart';
import 'package:maple_story_book/app/presentation/all/notice/bloc/notice_bloc.dart';
import 'package:maple_story_book/app/presentation/all/potential/bloc/potential_bloc.dart';
import 'package:maple_story_book/app/presentation/all/star_force/bloc/star_force_bloc.dart';
import 'package:maple_story_book/app/presentation/global/global_bloc.dart';
import 'package:maple_story_book/app/presentation/global/global_state.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';
import 'package:maple_story_book/app/presentation/router/app_router.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_book_app.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      :
///

class MapleStoryBookApp extends StatelessWidget {
  const MapleStoryBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<GlobalBloc>()),
        BlocProvider(create: (context) => getIt<HomeBloc>()),
        BlocProvider(create: (context) => getIt<RankingBloc>()),
        BlocProvider(create: (context) => getIt<GuildBloc>()),
        BlocProvider(create: (context) => getIt<NoticeBloc>()),
        BlocProvider(create: (context) => getIt<PotentialBloc>()),
        BlocProvider(create: (context) => getIt<StarForceBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        title: '메이플 스토리 북',
        theme: ThemeData(fontFamily: FontFamily.taengGu),
      ),
    );
  }
}
