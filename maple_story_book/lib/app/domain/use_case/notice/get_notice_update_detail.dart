import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_notice_update_detail.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetNoticeUpdateDetailUseCase implements IUseCase<ResultRest<NoticeDetail>, NoticeParams> {
  final INoticeRepository _noticeRepository;

  GetNoticeUpdateDetailUseCase(this._noticeRepository);

  @override
  Future<ResultRest<NoticeDetail>> execute([NoticeParams? params]) {
    final NoticeParams input = params ?? NoticeParams();

    return _noticeRepository.getNoticeUpdateDetail(noticeId: input.noticeId);
  }
}
