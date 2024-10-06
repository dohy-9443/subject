///
/// @Project name    : maple_story_book
/// @Class           : nick_name_validator_extension.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 6..
/// Description      : 
///

extension NickNameValidatorExtension on String {
  bool isValidNockName() {
    final regExp = RegExp(r'^[a-zA-Z0-9가-힣]*$');

    if (!regExp.hasMatch(this)) return false;

    int totalBytes = 0;
    for (var i = 0; i < this.length; i++) {
      totalBytes += this.codeUnitAt(i) > 0x7F ? 2 : 1;

      if (totalBytes > 12) return false;
    }

    return true;
  }
}