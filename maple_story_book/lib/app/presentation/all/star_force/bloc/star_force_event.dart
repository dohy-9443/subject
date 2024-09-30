import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : starForce_event.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

sealed class IStarForceEvent extends Equatable {}

final class GetStarForceEvent extends IStarForceEvent {
  final String count;
  final DateTime? date;
  final String? cursor;

  GetStarForceEvent({required this.count, this.date, this.cursor});

  @override
  // TODO: implement props
  List<Object?> get props => [count, date, cursor];

}