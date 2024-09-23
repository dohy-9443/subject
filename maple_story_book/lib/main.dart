import 'package:flutter/material.dart';
import 'package:maple_story_book/app/maple_story_book_app.dart';

import 'app/data/repository/repository.dart';
import 'app/data/source/source.dart';
import 'tool/network/network.dart';



void main() async {
  await initSettings();
  runApp(const MapleStoryBookApp());

  await CharacterRepository(
    CharacterDataSource(
      GetRemoteDataSource(
        GetMapleStoryBookCharacterApi(
          MapleStoryBookRestClient()
        )
      )
    )
  ).getOcid(characterName: 'l망치사냥꾼l');
}

Future<void> initSettings() async {
  WidgetsFlutterBinding.ensureInitialized();
}
