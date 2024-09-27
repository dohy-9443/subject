import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_notice_update.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetNoticeUpdateUseCase implements IUseCase<ResultRest<NoticeUpdate>, void> {
  final INoticeRepository _noticeRepository;

  GetNoticeUpdateUseCase(this._noticeRepository);

  @override
  Future<ResultRest<NoticeUpdate>> execute([void params]) {
    return _noticeRepository.getNoticeUpdate();
  }
}