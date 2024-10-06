///
/// @Project name    : maple_story_book
/// @Class           : null_check_extension.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 7..
/// Description      :
///

extension NullCheckExtension on dynamic {
  bool get hasData {
    return this != null ? true : false;
  }
}
