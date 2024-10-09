
///
/// @Project name    : maple_story_book
/// @Class           : base_state.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 9..
/// Description      : 
///

mixin IBaseState {
  bool get isSuccess;
  bool get isError;
  bool get isInitial;
}

mixin BaseSuccessState on IBaseState {
  @override
  bool get isSuccess => true;

  @override
  bool get isError => false;

  @override
  bool get isInitial => false;
}

mixin BaseErrorState on IBaseState {
  @override
  bool get isSuccess => false;

  @override
  bool get isError => true;

  @override
  bool get isInitial => false;

  dynamic get error;
  StackTrace? get stackTrace;
}

mixin BaseInitialState on IBaseState {
  @override
  bool get isSuccess => false;

  @override
  bool get isError => false;

  @override
  bool get isInitial => true;
}