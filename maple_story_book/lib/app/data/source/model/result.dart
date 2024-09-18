
///
/// @Project name    : maple_story_book
/// @Class           : result.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 18..
/// Description      :
///

abstract class Result<T> {
  static Result<T> fail<T>(Exception e) => Fail<T>(e);
  static Result<T> success<T>(T data) => Success<T>(data);

  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Exception e) onFail,
  }) {
    return this is Success ? onSuccess((this as Success).value) : onFail((this as Fail).error);
  }
}

class Success<T> extends Result<T>{
  final T value;

  Success(this.value);
}

class Fail<T> extends Result<T>{
  final Exception error;

  Fail(this.error);
}