///
/// @Project name    : maple_story_book
/// @Class           : result.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 18..
/// Description      :
///

abstract class ResultRest<T> {
  final T? data;

  final int code;

  final String? message;

  final Exception? error;

  const ResultRest({this.data, required this.code, this.message, this.error});

  bool isSuccess() => code == 200;

  bool isFail() => code != 200;
}


class Success<T> extends ResultRest<T>{
  const Success(T? data) : super(data: data, code: 200);
}

class Error<T> extends ResultRest<T> {
  const Error(int code, String message, Exception error) : super(code: code, message: message, error: error);
}