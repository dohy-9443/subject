import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : global.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 26..
/// Description      :
///
///

sealed class GlobalEvent extends Equatable {}

class GetOcIdEvent extends GlobalEvent {
  final String _characterName;

  GetOcIdEvent(this._characterName);

  String get characterName => _characterName;

  @override
  List<Object?> get props => [characterName];
}
