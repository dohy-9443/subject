import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_guild.freezed.dart';
part 'ranking_guild.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_guild.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class RankingGuild with _$RankingGuild {
  const factory RankingGuild({
    @Default([]) List<RankingGuildElement> ranking,
  }) = _RankingGuild;

  factory RankingGuild.fromJson(Map<String, dynamic> json) =>
      _$RankingGuildFromJson(json);
}

@freezed
class RankingGuildElement with _$RankingGuildElement {
  const factory RankingGuildElement({
    @Default('') String date,
    @Default(0) int ranking,
    @JsonKey(name: 'guild_name') @Default('') String guildName,
    @JsonKey(name: 'world_name') @Default('') String worldName,
    @JsonKey(name: 'guild_level') @Default(0) int guildLevel,
    @JsonKey(name: 'guild_master_name') @Default('') String guildMasterName,
    @JsonKey(name: 'guild_mark') @Default('') String guildMark,
    @JsonKey(name: 'guild_point') @Default(0) int guildPoint,
  }) = _RankingGuildElement;

  factory RankingGuildElement.fromJson(Map<String, dynamic> json) =>
      _$RankingGuildElementFromJson(json);
}