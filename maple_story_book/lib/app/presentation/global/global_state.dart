import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/core/util/bloc/bloc.dart';

part 'global_state.freezed.dart';


///
/// @Project name    : maple_story_book
/// @Class           : global_state.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      :
///

@freezed
class GlobalState with _$GlobalState implements BaseState {
  const GlobalState._();

  const factory GlobalState.initial() = GlobalInitial;
  const factory GlobalState.loading() = GlobalLoading;
  const factory GlobalState.success({
    @Default(Ocid()) Ocid ocid,
    @Default([]) List<LocalStorageModel> searches,
    @Default([]) List<LocalStorageModel> favorites,
    @Default([]) List<Ocid> rankerOcId,
    DateTime? date,
    @Default('') String characterName,
    @Default('') String worldName,
    @Default('') String characterGender,
    @Default('') String characterClass,
    @Default(0) int characterClassLevel,
    @Default(0) int characterLevel,
    @Default('') String characterExp,
    @Default('') String characterExpRate,
    @Default('') String characterGuildName,
    @Default('') String characterImage,
    @Default('') String characterDateCreate,
    @Default(false) bool accessFlag,
    @Default(false) bool liberationQuestClearFlag,
    @Default(BasicInfo()) BasicInfo basicInfo,
  }) = GlobalSuccess;
  const factory GlobalState.error() = GlobalError;

  @override
  // TODO: implement isError
  bool get isError => this is GlobalError;

  @override
  // TODO: implement isInitial
  bool get isInitial => this is GlobalInitial;

  @override
  // TODO: implement isLoading
  bool get isLoading => this is GlobalLoading;

  @override
  // TODO: implement isSuccess
  bool get isSuccess => this is GlobalSuccess;


}