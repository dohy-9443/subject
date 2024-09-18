///
/// @Project name    : maple_story_book
/// @Class           : use_case.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

abstract class IUseCase<T, Params> {
  Future<T> execute([Params params]);
}