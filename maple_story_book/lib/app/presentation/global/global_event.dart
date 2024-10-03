import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : global.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 26..
/// Description      :
///
///

sealed class IGlobalEvent extends Equatable {}

class GetOcIdEvent extends IGlobalEvent {
  final String _characterName;

  GetOcIdEvent(this._characterName);

  String get characterName => _characterName;

  @override
  List<Object?> get props => [characterName];
}

class AddFavoriteEvent extends IGlobalEvent {
  final String nickName;
  final String ocid;

  AddFavoriteEvent(this.nickName, this.ocid);

  @override
  // TODO: implement props
  List<Object?> get props => [nickName, ocid];
}

class AddSearchEvent extends IGlobalEvent {
  final String nickName;
  final String ocid;

  AddSearchEvent(this.nickName, this.ocid);

  @override
  // TODO: implement props
  List<Object?> get props => [nickName, ocid];
}

class RemoveFavoriteEvent extends IGlobalEvent {
  final String nickName;

  RemoveFavoriteEvent(this.nickName);

  @override
  // TODO: implement props
  List<Object?> get props => [nickName];
}

class LoadFavoritesEvent extends IGlobalEvent {
  LoadFavoritesEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadSearchesEvent extends IGlobalEvent {
  LoadSearchesEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}