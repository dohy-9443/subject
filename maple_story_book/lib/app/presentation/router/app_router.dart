import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_story_book/app/di/di_setup.dart';
import 'package:maple_story_book/app/presentation/all/all.dart';
import 'package:maple_story_book/app/presentation/all/guild/bloc/guild_bloc.dart';
import 'package:maple_story_book/app/presentation/all/notice/bloc/notice_bloc.dart';
import 'package:maple_story_book/app/presentation/all/potential/bloc/potential_bloc.dart';
import 'package:maple_story_book/app/presentation/all/star_force/bloc/star_force_bloc.dart';
import 'package:maple_story_book/app/presentation/global/global_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/presentation.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';
import 'package:maple_story_book/app/presentation/router/component/scaffold_nav_bar.dart';

///
/// @Project name    : maple_story_book
/// @Class           : app_router.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      :
///

class AppRouter {
  AppRouter();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) => MultiBlocProvider(
          providers: [
            BlocProvider<GlobalBloc>(create: (_) => getIt<GlobalBloc>()),
            BlocProvider<HomeBloc>(create: (_) => getIt<HomeBloc>()),
            BlocProvider<RankingBloc>(create: (_) => getIt<RankingBloc>()),
            BlocProvider<GuildBloc>(create: (_) => getIt<GuildBloc>()),
            BlocProvider<NoticeBloc>(create: (_) => getIt<NoticeBloc>()),
            BlocProvider<StarForceBloc>(create: (_) => getIt<StarForceBloc>()),
            BlocProvider<PotentialBloc>(create: (_) => getIt<PotentialBloc>()),
          ],
          child: ScaffoldNavBar(child: child),
        ),
        routes: [
          GoRoute(
            path: '/all',
            builder: (context, state) => const AllScreen(),
            routes: [
              GoRoute(
                path: 'guild',
                builder: (context, state) => BlocProvider<GuildBloc>(
                  create: (_) => getIt<GuildBloc>(),
                  child: const GuildScreen(),
                ),
              ),
              GoRoute(
                path: 'notice',
                builder: (context, state) => BlocProvider<NoticeBloc>(
                  create: (_) => getIt<NoticeBloc>(),
                  child: const NoticeScreen(),
                ),
              ),
              GoRoute(
                path: 'potential',
                builder: (context, state) => BlocProvider<PotentialBloc>(
                  create: (_) => getIt<PotentialBloc>(),
                  child: const PotentialScreen(),
                ),
              ),
              GoRoute(
                path: 'star-force',
                builder: (context, state) => BlocProvider<StarForceBloc>(
                  create: (_) => getIt<StarForceBloc>(),
                  child: const StarForceScreen(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/search',
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            path: '/ranking',
            builder: (context, state) => const RankingScreen(),
          ),
        ],
      ),
    ],
  );
}

