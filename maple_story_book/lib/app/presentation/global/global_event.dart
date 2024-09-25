import 'package:equatable/equatable.dart';

sealed class GlobalEvent extends Equatable {}

class GetOcIdEvent extends GlobalEvent {
  final String _characterName;

  GetOcIdEvent(this._characterName);

  String get characterName => _characterName;

  @override
  List<Object?> get props => [characterName];
}
