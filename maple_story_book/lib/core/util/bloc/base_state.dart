import 'package:equatable/equatable.dart';

///
/// @Project name    : maple_story_book
/// @Class           : base_state.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 9..
/// Description      : 
///

abstract class IBaseState extends Equatable {}

abstract class IBaseStateWithData<T> extends IBaseState {
  T? get data;
}

abstract class InitialState extends IBaseState {}

abstract class ErrorState extends IBaseState {
  final dynamic error;
  final StackTrace? stackTrace;

  ErrorState({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [];
}

extension BaseStateWhen<DataT> on IBaseState {
  TResult when<TResult>({
    required TResult Function() initial,
    required TResult Function(DataT data) success,
    required TResult Function(dynamic error, StackTrace? stackTrace) error,
    TResult Function()? orElse,
  }) {
    if (this is InitialState) {
      return initial();
    } else if (this is IBaseStateWithData<DataT> && (this as IBaseStateWithData<DataT>).data is DataT) {
      final IBaseStateWithData<DataT> successState = this as IBaseStateWithData<DataT>;
      if (successState.data != null) {
        return success(successState.data as DataT);
      }
    } else if (this is ErrorState) {
      final errorState = this as ErrorState;
      return error(errorState.error, errorState.stackTrace);
    }

    return orElse!();
  }
}