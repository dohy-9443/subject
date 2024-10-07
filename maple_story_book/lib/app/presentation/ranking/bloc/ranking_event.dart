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
  final DateTime date;
  final String? worldName;
  final String? ocid;
  final int? page;

  GetRankingEvent({required this.date, this.worldName, this.ocid, this.page});

  @override
  List<Object?> get props => [date, worldName, ocid, page];
}

final class GetRankingGuildEvent<T> extends IRankingEvent<T> {
  final DateTime date;
  final String worldName;
  final int rankingType;
  final String guildName;
  final int page;

  GetRankingGuildEvent({required this.date, required this.worldName, required this.rankingType, required this.guildName, required this.page});


  @override
  List<Object?> get props => [date, worldName, rankingType, guildName, page];
}

final class GetRankingOverallEvent<T> extends IRankingEvent<T> {
  final DateTime date;
  final String? worldName;
  final String? worldType;
  final String? availableValue;
  final String? ocid;
  final int? page;

  GetRankingOverallEvent({required this.date, this.worldName, this.worldType, this.availableValue, this.ocid, this.page});

  @override
  List<Object?> get props =>
      [date, worldName, worldType, availableValue, ocid, page];
}

final class GetRankingStudioEvent<T> extends IRankingEvent<T> {
  final DateTime date;
  final String? worldName;
  final int difficulty;
  final String? availableValue;
  final String? ocid;
  final int? page;

  GetRankingStudioEvent({required this.date, this.worldName, required this.difficulty, this.availableValue, this.ocid, this.page});

  @override
  List<Object?> get props =>
      [date, worldName, difficulty, availableValue, ocid, page];
}
