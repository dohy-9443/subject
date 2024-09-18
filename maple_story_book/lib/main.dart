import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:maple_story_book/app/maple_story_book_app.dart';

void main() async {
  await initSettings();
  runApp(const MapleStoryBookApp());
}

Future<void> initSettings() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "maple_story_book.env");
}
