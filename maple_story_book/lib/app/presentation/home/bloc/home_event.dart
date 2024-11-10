import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_event.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 26..
/// Description      : 
///

// sealed class IHomeEvent<T> extends Equatable {}
//
// final class GetHomeEvent<T> extends IHomeEvent<T> {
//   final String ocid;
//   final DateTime? date;
//
//   GetHomeEvent({required this.ocid, this.date});
//
//   @override
//   List<Object?> get props => [ocid, date];
// }
//
// final class GetSkillEvent extends IHomeEvent {
//   final String ocid;
//   final DateTime? date;
//   final String characterSkillGrade;
//
//   GetSkillEvent({required this.ocid, this.date, required this.characterSkillGrade});
//
//   @override
//   List<Object?> get props => [ocid, date, characterSkillGrade];
// }

// 테스트

@freezed
class HomeEvent<T> with _$HomeEvent<T> {
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