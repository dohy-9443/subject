import 'package:equatable/equatable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : starForce_state.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

sealed class IStarForceState extends Equatable {}

final class StarForceInitial extends IStarForceState {
  StarForceInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class StarForceSuccess extends IStarForceState {
  final bool isLoading;
  final StarForceHistory? starForceHistory;

  StarForceSuccess({this.isLoading = false, this.starForceHistory});

  StarForceSuccess copyWith({ bool? isLoading, StarForceHistory? starForceHistory }) {
    return StarForceSuccess(
      isLoading: isLoading ?? this.isLoading,
      starForceHistory: starForceHistory ?? this.starForceHistory,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, starForceHistory];
}

final class StarForceError extends IStarForceState {
  final dynamic error;
  final StackTrace? stackTrace;

  StarForceError({required this.error, required this.stackTrace});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}