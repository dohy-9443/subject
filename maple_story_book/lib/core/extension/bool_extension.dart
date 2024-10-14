///
/// @Project name    : maple_story_book
/// @Class           : bool_extension.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 15..
/// Description      :
///

extension IsBoolExtension on bool {
  bool get isTrue {
    return this == true ? true : false;
  }
}