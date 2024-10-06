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

// 문자열이 null 이거나 빈 문자열인지 확인 함수
bool isStringNullOrEmpty(String? value) {
  return value == null || value.trim().isEmpty;
}

// 닉네임 검색 유효성 검사 함수
bool isValidNickName(String nickName) {
  /// ** 메이플 스토리 닉네임 제한 사항
  /// - 특수문자 x
  /// - 총 12바이트로 제한
  /// - 한글 6자 (한글자당 2바이트)
  /// - 숫자, 영어 12 (한글자당 1바이트)

  // 정규식 (영어, 숫자, 한글만 허용)
  final regExp = RegExp(r'^[a-zA-Z0-9가-힣]*$');

  if (!regExp.hasMatch(nickName)) return false;

  int totalBytes = 0;
  for (var i = 0; i < nickName.length; i++) {
    // codePoint 가 0x80 이상인 경우 한글로 간주하여 2바이트로 계산하는 식
    if (nickName.codeUnitAt(i) > 0x7F) {
      totalBytes += 2;
    } else {
      // 그게 아니라면 영어 또는 숫자이니 1바이트로 계산
      totalBytes += 1;
    }

    // 만약 바이트 수가 12를 초과 한다면 즉시 false 를 반환
    if (totalBytes > 12) return false;
  }

  // 모든 과정을 통과하면 true
  return true;
}