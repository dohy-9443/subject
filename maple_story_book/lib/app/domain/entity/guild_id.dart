import 'package:freezed_annotation/freezed_annotation.dart';

part 'guild_id.freezed.dart';

part 'guild_id.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : guild_id.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class GuildId with _$GuildId {
  const factory GuildId({
    @JsonKey(name: 'oguild_id') @Default('') String oGuildId,
  }) = _GuildId;

  factory GuildId.fromJson(Map<String, dynamic> json) =>
      _$GuildIdFromJson(json);
}
