import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice_event.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

sealed class INoticeEvent<T> extends Equatable {}

final class GetNoticeEvent<T> extends INoticeEvent<T> {
  final int _noticeId;

  GetNoticeEvent(this._noticeId);

  int get noticeId => _noticeId;

  @override
  List<Object?> get props => [noticeId];
}


