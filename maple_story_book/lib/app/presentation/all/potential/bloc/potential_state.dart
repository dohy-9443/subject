import 'package:equatable/equatable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : potential_state.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

sealed class IPotentialState extends Equatable {}

final class PotentialInitial extends IPotentialState {
  PotentialInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class PotentialSuccess extends IPotentialState {
  final bool isLoading;
  final CubeHistory? cubeHistory;
  final PotentialHistory? potentialHistory;

  PotentialSuccess({this.isLoading = false, this.cubeHistory, this.potentialHistory});

  PotentialSuccess copyWith({ bool? isLoading, CubeHistory? cubeHistory, PotentialHistory? potentialHistory }) {
    return PotentialSuccess(
      isLoading: isLoading ?? this.isLoading,
      cubeHistory: cubeHistory ?? this.cubeHistory,
      potentialHistory: potentialHistory ?? this.potentialHistory,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, cubeHistory, potentialHistory];
}

final class PotentialError extends IPotentialState {
  final dynamic error;
  final StackTrace? stackTrace;

  PotentialError({required this.error, required this.stackTrace});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}