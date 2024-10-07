import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_event.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 26..
/// Description      : 
///

sealed class IHomeEvent<T> extends Equatable {}

final class GetHomeEvent<T> extends IHomeEvent<T> {
  final String ocid;
  final DateTime? date;

  GetHomeEvent({required this.ocid, this.date});

  @override
  List<Object?> get props => [ocid, date];
}

final class GetSkillEvent extends IHomeEvent {
  final String ocid;
  final DateTime? date;
  final String characterSkillGrade;

  GetSkillEvent({required this.ocid, this.date, required this.characterSkillGrade});

  @override
  List<Object?> get props => [ocid, date, characterSkillGrade];
}