import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/di/di_setup.dart';
import 'package:maple_story_book/app/maple_story_book_app.dart';
import 'package:maple_story_book/app/presentation/all/guild/bloc/guild_bloc.dart';
import 'package:maple_story_book/app/presentation/all/notice/bloc/notice_bloc.dart';
import 'package:maple_story_book/app/presentation/all/potential/bloc/potential_bloc.dart';
import 'package:maple_story_book/app/presentation/all/star_force/bloc/star_force_bloc.dart';
import 'package:maple_story_book/app/presentation/global/global_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
      MultiBlocProvider(
    providers: [
      BlocProvider<GlobalBloc>(create: (_) => getIt<GlobalBloc>()),
      BlocProvider<HomeBloc>(create: (_) => getIt<HomeBloc>()),
      BlocProvider<RankingBloc>(create: (_) => getIt<RankingBloc>()),
      BlocProvider<GuildBloc>(create: (_) => getIt<GuildBloc>()),
      BlocProvider<NoticeBloc>(create: (_) => getIt<NoticeBloc>()),
      BlocProvider<StarForceBloc>(create: (_) => getIt<StarForceBloc>()),
      BlocProvider<PotentialBloc>(create: (_) => getIt<PotentialBloc>()),
    ],
    child: const MapleStoryBookApp(),
  ));
}
