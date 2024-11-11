import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/bloc/base_event.dart';

part 'global_event.freezed.dart';

///
/// @Project name    : maple_story_book
/// @Class           : global.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 26..
/// Description      :
///
///

@freezed
class GlobalEvent with _$GlobalEvent implements BaseEvent {
  const factory GlobalEvent.GetOcId({
    required String characterName
  }) = GetOcIdEvent;

  const factory GlobalEvent.AddFavorite({
    required String nickName,
    required String ocid,
  }) = AddFavoriteEvent;

  const factory GlobalEvent.AddSearch({
    required String nickName,
    required String ocid,
  }) = AddSearchEvent;

  const factory GlobalEvent.RemoveFavorite({
    required String nickName,
  }) = RemoveFavoriteEvent;

  const factory GlobalEvent.LoadFavorites() = LoadFavoritesEvent;

  const factory GlobalEvent.LoadSearches() = LoadSearchesEvent;

  const factory GlobalEvent.GetOcIdList({
    required List<String> characterNameList,
  }) = GetOcIdListEvent;

  const factory GlobalEvent.GetBasicInfo({
    required String ocid,
    DateTime? date,
  }) = GetBasicInfoEvent;
}