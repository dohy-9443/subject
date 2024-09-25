import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_state.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 25..
/// Description      : 
///

abstract class IMSState<T> extends Equatable {
  final T? _data;

  const IMSState({T? data}) : _data = data;

  T? get data => _data;

  bool get hasData => data != null;

  @override
  List<Object?> get props => [data];
}

final class InitialState<T> extends IMSState<T> {
  const InitialState({super.data});
}

final class LoadingState<T> extends IMSState<T> {
  const LoadingState({super.data});
}

final class EmptyState<T> extends IMSState<T> {
  const EmptyState({super.data});
}

final class DataState<T> extends IMSState<T> {
  final DateTime? updatedAt;

  const DataState({required super.data, this.updatedAt});

  @override
  T get data => super.data!;

  @override
  List<Object?> get props => [data, if(updatedAt != null) updatedAt!.millisecondsSinceEpoch];
}

final class ErrorState<T> extends IMSState<T> {
  final dynamic error;
  final StackTrace? stackTrace;

  const ErrorState({super.data, this.error, this.stackTrace});

  bool get hasError => error != null;

  @override
  List<Object?> get props => [...super.props, error, stackTrace];
}
