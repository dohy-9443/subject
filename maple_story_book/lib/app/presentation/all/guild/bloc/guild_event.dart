import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : guild_event.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

sealed class IGuildEvent extends Equatable {}

final class GetGuildIdEvent extends IGuildEvent {
  final String guildName;
  final String worldName;

  GetGuildIdEvent({required this.guildName, required this.worldName});

  @override
  // TODO: implement props
  List<Object?> get props => [guildName, worldName];

}

final class GetGuildBasicEvent extends IGuildEvent {
  final String oGuildId;
  final DateTime? date;

  GetGuildBasicEvent({required this.oGuildId, this.date});

  @override
  // TODO: implement props
  List<Object?> get props => [oGuildId, date];

}