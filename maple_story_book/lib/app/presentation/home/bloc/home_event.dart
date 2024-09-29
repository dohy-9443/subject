import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_event.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 26..
/// Description      : 
///

sealed class IHomeEvent extends Equatable {}

final class GetHomeEvent extends IHomeEvent {
  final String _ocid;
  final DateTime _date;

  GetHomeEvent(this._ocid, this._date);

  String get ocid => _ocid;
  DateTime get date => _date;

  @override
  List<Object?> get props => [ocid, date];
}

final class GetSkillEvent extends IHomeEvent {
  final String _ocid;
  final DateTime _date;
  final String _characterSkillGrade;

  GetSkillEvent(this._ocid, this._date, this._characterSkillGrade);

  String get ocid => _ocid;
  DateTime get date => _date;
  String get characterSkillGrade => _characterSkillGrade;

  @override
  List<Object?> get props => [ocid, date, characterSkillGrade];
}