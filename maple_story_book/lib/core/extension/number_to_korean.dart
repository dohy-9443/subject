///
/// @Project name    : maple_story_book
/// @Class           : number_to_korean_style.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 15..
/// Description      : 
///

extension NumberFormatting on double {
  String NumberToKorean() {
    int intNum = this.toInt();
    double doubleNum = this - intNum;

    int millions = intNum ~/ 1000000;
    int remains = intNum % 1000000;

    String result = millions > 0 ? '$millions만$remains' : '$remains';

    if (doubleNum > 0) {
      result += doubleNum.toStringAsFixed(2).substring(1);
    }

    return result;
  }
}