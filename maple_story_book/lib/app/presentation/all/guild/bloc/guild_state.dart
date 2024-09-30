import 'package:equatable/equatable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : guild_state.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

sealed class IGuildState extends Equatable {}

final class GuildInitial extends IGuildState {
  GuildInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class GuildSuccess extends IGuildState {
  final bool isLoading;
  final GuildId? guildId;
  final GuildBasicInfo? guildBasicInfo;

  GuildSuccess({this.isLoading = false, this.guildId, this.guildBasicInfo});

  GuildSuccess copyWith({ bool? isLoading, GuildId? guildId, GuildBasicInfo? guildBasicInfo }) {
    return GuildSuccess(
      isLoading: isLoading ?? this.isLoading,
      guildId: guildId ?? this.guildId,
      guildBasicInfo: guildBasicInfo ?? this.guildBasicInfo,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, guildId, guildBasicInfo];
}

final class GuildError extends IGuildState {
  final dynamic error;
  final StackTrace? stackTrace;

  GuildError({required this.error, required this.stackTrace});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}