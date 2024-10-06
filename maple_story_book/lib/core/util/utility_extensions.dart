///
/// @Project name    : maple_story_book
/// @Class           : utility_extensions.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 6..
/// Description      : 
///

// 시간 반환 함수
String formatSeconds(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;

  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return "$minutesStr분 $secondsStr초";
}

// 문자열이 null 이거나 빈 문자열인지 확인
bool isStringNullOrEmpty(String? value) {
  return value == null || value.trim().isEmpty;
}