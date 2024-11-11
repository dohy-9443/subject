import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/bloc/bloc.dart';

part 'home_event.freezed.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_event.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 26..
/// Description      : 
///


@freezed
class HomeEvent<T> with _$HomeEvent<T> implements BaseEvent {
  const factory HomeEvent.getHome({
    required String ocid,
    DateTime? date,
  }) = GetHomeEvent<T>;

  const factory HomeEvent.getSkill({
    required String ocid,
    DateTime? date,
    required String characterSkillGrade,
  }) = GetSkillEvent;
}