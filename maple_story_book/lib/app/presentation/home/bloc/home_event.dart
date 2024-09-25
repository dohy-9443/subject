import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_event.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 26..
/// Description      : 
///

sealed class IHomeEvent extends Equatable {}

final class GetAbilityEvent extends IHomeEvent {
  final String _ocid;
  final DateTime _date;

  GetAbilityEvent(this._ocid, this._date);

  String get ocid => _ocid;
  DateTime get date => _date;

  @override
  // TODO: implement props
  List<Object?> get props => [ocid, date];

}

final class GetOcIdEvent extends IHomeEvent {
  final String _characterName;

  GetOcIdEvent(this._characterName);

  String get characterName => _characterName;

  @override
  List<Object?> get props => [characterName];
}