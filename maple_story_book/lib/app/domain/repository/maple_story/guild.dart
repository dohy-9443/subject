import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : guild.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      :
///

abstract class IGuildRepository {
  // 길드 식별자(oguild_id) 정보 조회
  Future<ResultRest<GuildId>> getGuildId({required String guildName, required String worldName});
  // 기본 정보 조회
  Future<ResultRest<GuildBasicInfo>> getGuildBasic({required String oGuildId, DateTime? date});
}