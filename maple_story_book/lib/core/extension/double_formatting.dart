///
/// @Project name    : maple_story_book
/// @Class           : number_to_korean_style.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 15..
/// Description      : 
///

extension DoubleFormatting on double {
  String numberToKorean() {
    int intNum = this.toInt();
    double doubleNum = this - intNum;

    int millions = intNum ~/ 10000;
    int remains = intNum % 10000;

    String result = millions > 0 ? '$millions만 $remains' : '$remains';

    if (doubleNum > 0) {
      result += doubleNum.toStringAsFixed(2).substring(1);
    }

    return result;
  }

  String toCommaString() {
    return this.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',');
  }

  String toPercentageString() {
    return '${this.toStringAsFixed(2)}%';
  }

  String toIntString() {
    return this.toInt().toString();
  }
}