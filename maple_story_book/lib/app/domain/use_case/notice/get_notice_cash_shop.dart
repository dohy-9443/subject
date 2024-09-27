import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_notice_cash_shop.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@lazySingleton
class GetNoticeCashShopUseCase implements IUseCase<ResultRest<NoticeCashShop>, void> {
  final INoticeRepository _noticeRepository;

  GetNoticeCashShopUseCase(this._noticeRepository);

  @override
  Future<ResultRest<NoticeCashShop>> execute([void params]) {
    return _noticeRepository.getNoticeCashShop();
  }
}