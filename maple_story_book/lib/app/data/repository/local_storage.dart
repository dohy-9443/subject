import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// @Project name    : maple_story_book
/// @Class           : local_repository.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      : 
///

@singleton
class LocalStorageRepository implements ILocalStorageRepository {

  static const int _maxLength = 10;

  String _getKey(String category) {
    switch (category) {
      case 'favorite':
        return 'LOCAL_STORAGE_SEARCH_KEY';
      case 'search':
        return 'LOCAL_STORAGE_FAVORITE_KEY';
      default:
        return 'LOCAL_STORAGE_SEARCH_KEY';
    }
  }

  @override
  Future<void> addEntry(String category, LocalStorageModel entry) async {
    final history = await getHistory(category);

    history.removeWhere((element) => element.nickName == entry.nickName);

    // 새 항목 추가
    history.add(entry);

    // 리스트의 길이를 10개로 제한
    if (history.length > _maxLength) {
      history.removeAt(0);
    }

    // 업데이트된 리스트 저장
    await saveHistory(category, history);
  }

  @override
  Future<void> deleteHistory(String category) async {
    await dotenv.load(fileName: "maple_story_book.env");
    final prefs = await SharedPreferences.getInstance();
    final storageKey = dotenv.env[_getKey(category)];
    await prefs.remove(storageKey!);
  }

  @override
  Future<List<LocalStorageModel>> getHistory(String category) async {
    await dotenv.load(fileName: "maple_story_book.env");
    final prefs = await SharedPreferences.getInstance();
    final storageKey = dotenv.env[_getKey(category)];
    final historyJson = prefs.getString(storageKey!);

    if (historyJson == null) return [];

    final decoded = json.decode(historyJson);
    return ListLocalStorageModel.fromJson(decoded).localStorages;

  }

  @override
  Future<void> removeEntry(String category, String nickName) async {
    final history = await getHistory(category);

    history.removeWhere((element) => element.nickName == nickName);

    await saveHistory(category, history);
  }

  @override
  Future<void> saveHistory(String category, List<LocalStorageModel> history) async {
    await dotenv.load(fileName: "maple_story_book.env");
    final prefs = await SharedPreferences.getInstance();
    final storageKey = dotenv.env[_getKey(category)];
    final encodedData = json.encode(ListLocalStorageModel(localStorages: history).toJson());

    await prefs.setString(storageKey!, encodedData);
  }
}