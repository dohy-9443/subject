import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:maple_story_book/app/maple_story_book_app.dart';

import 'app/data/repository/repository.dart';
import 'app/data/source/source.dart';
import 'tool/network/network.dart';



void main() async {
  await initSettings();
  runApp(const MapleStoryBookApp());

  await CharacterRepository(CharacterDataSource(GetRemoteDataSource(GetMapleStoryBookCharacterApi(MapleStoryBookRestClient())))).getOcid();
}

Future<void> initSettings() async {
  WidgetsFlutterBinding.ensureInitialized();

  DotEnv env = DotEnv();

  await env.load(fileName: "maple_story_book.env");
}
