import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : potential_event.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

sealed class IPotentialEvent<T> extends Equatable {
}

final class GetPotentialEvent<T> extends IPotentialEvent<T> {
  final String count;
  final DateTime? date;
  final String? cursor;

  GetPotentialEvent(this.count, {this.date, this.cursor});

  @override
  // TODO: implement props
  List<Object?> get props => [count, date, cursor];

}