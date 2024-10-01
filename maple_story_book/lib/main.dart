import 'package:flutter/material.dart';
import 'package:maple_story_book/app/di/di_setup.dart';
import 'package:maple_story_book/app/maple_story_book_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MapleStoryBookApp());
}
