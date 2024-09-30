import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/di/di_setup.dart';
import 'package:maple_story_book/app/maple_story_book_app.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
      MultiBlocProvider(
    providers: [
      BlocProvider<HomeBloc>(create: (_) => getIt<HomeBloc>())
    ],
    child: const MapleStoryBookApp(),
  ));
}
