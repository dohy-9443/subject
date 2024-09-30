import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_event.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

sealed class IRankingEvent<T> extends Equatable {}

final class GetRankingEvent<T> extends IRankingEvent<T> {
  final DateTime _date;
  final String _worldName;
  final String _ocid;
  final int _page;

  GetRankingEvent(this._date, this._worldName, this._ocid, this._page);

  DateTime get date => _date;
  String get worldName => _worldName;
  String get ocid => _ocid;
  int get page => _page;

  @override
  List<Object?> get props => [date, worldName, ocid, page];
}

final class GetRankingGuildEvent<T> extends IRankingEvent<T> {
  final DateTime _date;
  final String _worldName;
  final int _rankingType;
  final String _guildName;
  final int _page;

  GetRankingGuildEvent(
    this._date,
    this._worldName,
    this._rankingType,
    this._guildName,
    this._page,
  );

  DateTime get date => _date;
  String get worldName => _worldName;
  int get rankingType => _rankingType;
  String get guildName => _guildName;
  int get page => _page;

  @override
  List<Object?> get props => [date, worldName, rankingType, guildName, page];
}

final class GetRankingOverallEvent<T> extends IRankingEvent<T> {
  final DateTime _date;
  final String _worldName;
  final String _worldType;
  final String _availableValue;
  final String _ocid;
  final int _page;

  GetRankingOverallEvent(
    this._date,
    this._worldName,
    this._worldType,
    this._availableValue,
    this._ocid,
    this._page,
  );

  DateTime get date => _date;
  String get worldName => _worldName;
  String get worldType => _worldType;
  String get availableValue => _availableValue;
  String get ocid => _ocid;
  int get page => _page;

  @override
  List<Object?> get props =>
      [date, worldName, worldType, availableValue, ocid, page];
}

final class GetRankingStudioEvent<T> extends IRankingEvent<T> {
  final DateTime _date;
  final String _worldName;
  final int _difficulty;
  final String _availableValue;
  final String _ocid;
  final int _page;

  GetRankingStudioEvent(
    this._date,
    this._worldName,
    this._difficulty,
    this._availableValue,
    this._ocid,
    this._page,
  );
  DateTime get date => _date;
  String get worldName => _worldName;
  int get difficulty => _difficulty;
  String get availableValue => _availableValue;
  String get ocid => _ocid;
  int get page => _page;
  @override
  List<Object?> get props =>
      [date, worldName, difficulty, availableValue, ocid, page];
}
