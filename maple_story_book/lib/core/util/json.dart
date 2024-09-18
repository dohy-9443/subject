///
/// @Project name    : maple_story_book
/// @Class           : json.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

bool stringToConvertBool(String value) {
  return value == 'true' ? true : false;
}

double stringToConvertDouble(String? value) {
  if (value == null) return 0;

  try {
    return double.parse(value);
  } catch (e) {
    return 0;
  }
}