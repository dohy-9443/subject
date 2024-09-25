import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/maple_story_book_app.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';

import 'app/data/repository/repository.dart';
import 'app/data/source/source.dart';
import 'app/di/di_setup.dart';
import 'tool/network/network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext context) => HomeBloc(CharacterRepository(CharacterDataSource(GetMapleStoryBookCharacterApi(MapleStoryBookRestClient()))))),
    ],
    child: const MapleStoryBookApp(),
  ));
}
