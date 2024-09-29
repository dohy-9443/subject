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
  final BasicInfo? basicInfo;

  const IHomeState({this.ocid, this.ability, this.basicInfo,});
}

class HomeInitial extends IHomeState {
  const HomeInitial({super.ocid, super.ability, super.basicInfo});

  @override
  List<Object?> get props => [ocid, ability, basicInfo];
}

class HomeLoading extends IHomeState {
  const HomeLoading({super.ocid, super.ability, super.basicInfo});

  @override
  List<Object?> get props => [ocid, ability, basicInfo];
}

class HomeSuccess extends IHomeState {
  const HomeSuccess({super.ocid, super.ability, super.basicInfo});

  @override
  List<Object?> get props => [ocid, ability, basicInfo];
}

class HomeError extends IHomeState {
  final dynamic error;
  final StackTrace? stackTrace;

  HomeError({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [];
}
