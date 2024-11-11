import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/bloc/bloc.dart';

part 'ranking_event.freezed.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_event.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

@freezed
class RankingEvent<T> with _$RankingEvent<T> implements BaseEvent {
  const factory RankingEvent.GetRanking({
    required DateTime date,
    String? worldName,
    String? ocid,
    int? page,
  }) = GetRankingEvent<T>;

  const factory RankingEvent.GetRankingGuild({
    required DateTime date,
    required String worldName,
    required int rankingType,
    required String guildName,
    required int page,
  }) = GetRankingGuildEvent<T>;

  const factory RankingEvent.GetRankingOverall({
    required DateTime date,
    String? worldName,
    String? worldType,
    String? availableValue,
    String? ocid,
    int? page,
  }) = GetRankingOverallEvent<T>;

  const factory RankingEvent.GetRankingStudio({
    required DateTime date,
    String? worldName,
    required int difficulty,
    String? availableValue,
    String? ocid,
    int? page,
  }) = GetRankingStudioEvent<T>;


  const factory RankingEvent.SelectWorldFilter({
    required String selectWorldName,
    required int tabIndex,
    required int selectWorldIndex,
  }) = SelectWorldFilterEvent;
}