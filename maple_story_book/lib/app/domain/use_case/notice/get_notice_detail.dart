import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/app/data/source/source.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_notice_detail.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@lazySingleton
class GetNoticeDetailUseCase implements IUseCase<ResultRest<NoticeDetail>, NoticeParams> {
  final INoticeRepository _noticeRepository;

  GetNoticeDetailUseCase(this._noticeRepository);

  @override
  Future<ResultRest<NoticeDetail>> execute([NoticeParams? params]) {
    final NoticeParams input = params ?? NoticeParams();

    return _noticeRepository.getNoticeDetail(noticeId: input.noticeId);
  }
}
