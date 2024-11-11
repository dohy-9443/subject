import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'ranking_state.freezed.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_state.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

@freezed
class RankingState with _$RankingState implements BaseState {
  const RankingState._();

  const factory RankingState.initial() = RankingInitial;
  const factory RankingState.loading() = RankingLoading;
  const factory RankingState.success({
    @Default(RankingAchievement()) RankingAchievement rankingAchievement,
    @Default(RankingGuild()) RankingGuild rankingGuild,
    @Default(RankingOverall()) RankingOverall rankingOverall,
    @Default(RankingStudio()) RankingStudio rankingStudio,
    @Default(RankingTheSeed()) RankingTheSeed rankingTheSeed,
    @Default(RankingUnion()) RankingUnion rankingUnion,
    @Default('') String selectWorldName,
    @Default(0) int selectWorldIndex,
  }) = RankingSuccess;
  const factory RankingState.error({required String errorMessage}) = RankingError;

  @override
  // TODO: implement isError
  bool get isError => this is RankingError;

  @override
  // TODO: implement isInitial
  bool get isInitial => this is RankingInitial;

  @override
  // TODO: implement isLoading
  bool get isLoading => this is RankingError;

  @override
  // TODO: implement isSuccess
  bool get isSuccess => this is RankingSuccess;

  @override
  // TODO: implement error
  get error => this is RankingError ? (this as RankingError).errorMessage : null;
}