import 'package:equatable/equatable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_state.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

sealed class IRankingState extends Equatable {}

final class RankingInitial extends IRankingState {
  RankingInitial();

  @override
  List<Object?> get props => [];
}

final class RankingSuccess extends IRankingState {
  final bool isLoading;
  final RankingAchievement? rankingAchievement;
  final RankingGuild? rankingGuild;
  final RankingOverall? rankingOverall;
  final RankingStudio? rankingStudio;
  final RankingTheSeed? rankingTheSeed;
  final RankingUnion? rankingUnion;

  RankingSuccess({
    this.isLoading = false,
    this.rankingAchievement,
    this.rankingGuild,
    this.rankingOverall,
    this.rankingStudio,
    this.rankingTheSeed,
    this.rankingUnion,
  });

  RankingSuccess copyWith({
    bool? isLoading,
    Notice? notice,
    RankingAchievement? rankingAchievement,
    RankingGuild? rankingGuild,
    RankingOverall? rankingOverall,
    RankingStudio? rankingStudio,
    RankingTheSeed? rankingTheSeed,
    RankingUnion? rankingUnion,
  }) {
    return RankingSuccess(
      isLoading: isLoading ?? this.isLoading,
      rankingAchievement: rankingAchievement ?? this.rankingAchievement,
      rankingGuild: rankingGuild ?? this.rankingGuild,
      rankingOverall: rankingOverall ?? this.rankingOverall,
      rankingStudio: rankingStudio ?? this.rankingStudio,
      rankingTheSeed: rankingTheSeed ?? this.rankingTheSeed,
      rankingUnion: rankingUnion ?? this.rankingUnion,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    rankingAchievement,
    rankingGuild,
    rankingOverall,
    rankingStudio,
    rankingTheSeed,
    rankingUnion,
  ];
}

final class RankingError extends IRankingState {
  final dynamic error;
  final StackTrace? stackTrace;

  RankingError({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [error, stackTrace];
}