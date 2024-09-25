import 'package:equatable/equatable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_state.
/// @Created by      : shineheetae.
/// Created On       : 2024. 9. 18..
/// Description      :
///

sealed class IHomeState extends Equatable {
  final Ocid? ocid;
  final Ability? ability;

  const IHomeState({this.ocid, this.ability});
}

class HomeInitial extends IHomeState {
  const HomeInitial({super.ocid, super.ability});

  @override
  List<Object?> get props => [ocid, ability];
}

class HomeLoading extends IHomeState {
  const HomeLoading({super.ocid, super.ability});

  @override
  List<Object?> get props => [ocid, ability];
}

class HomeSuccess extends IHomeState {
  const HomeSuccess({super.ocid, super.ability});

  @override
  List<Object?> get props => [ocid, ability];
}

class HomeError extends IHomeState {
  final dynamic error;
  final StackTrace? stackTrace;

  HomeError({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [];
}
