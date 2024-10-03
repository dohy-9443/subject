import 'package:equatable/equatable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : global_state.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      : 
///

sealed class IGlobalState extends Equatable {}

final class GlobalInitial extends IGlobalState {
  GlobalInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class GlobalSuccess extends IGlobalState {
  final bool isLoading;
  final Ocid? ocid;

  GlobalSuccess({
    this.isLoading = false,
    this.ocid,
  });

  GlobalSuccess copyWith({bool? isLoading, Ocid? ocid}) {
    return GlobalSuccess(
      isLoading: isLoading ?? this.isLoading,
      ocid: ocid ?? this.ocid,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, ocid];
}

final class GlobalError extends IGlobalState {
  final dynamic error;
  final StackTrace? stackTrace;

  GlobalError({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [error, stackTrace];
}