///
/// @Project name    : maple_story_book
/// @Class           : number_to_korean_style.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 15..
/// Description      : 
///

extension DoubleFormatting on num {
  String numberToKorean() {
    int intNum = this.toInt();
    double doubleNum = (this as double) - intNum;

    int billions = intNum ~/ 100000000;
    int millions = (intNum % 100000000) ~/ 10000;
    int remains = intNum % 10000;

    String result = '';

    if (billions > 0) {
      result += '$billions억 ';
    }
    if (millions > 0 || billions > 0) {
      result += '$millions만 ';
    }
    result += '$remains';

    if (doubleNum > 0) {
      result += doubleNum.toStringAsFixed(2).substring(1);
    }

    return result.trim();
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

  String toIntFormatTime() {
    int minutes = this ~/ 60;
    int seconds = (this as int) % 60;

    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = seconds.toString().padLeft(2, '0');

    return '$formattedMinutes분 $formattedSeconds초';
  }
}