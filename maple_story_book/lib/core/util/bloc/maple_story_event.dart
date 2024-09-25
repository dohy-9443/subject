import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_event.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 25..
/// Description      : 
///

abstract class IMSEvent extends Equatable {
  const IMSEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class MSEvent<T> extends IMSEvent {
  final T params;

  const MSEvent(this.params);

  @override
  // TODO: implement props
  List<Object?> get props => [params];
}