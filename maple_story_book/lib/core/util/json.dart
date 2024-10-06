import 'package:intl/intl.dart';

///
/// @Project name    : maple_story_book
/// @Class           : json.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      :
///

// string -> bool
bool stringToConvertBool(String value) {
  return value == 'true' ? true : false;
}

// string -> double
double stringToConvertDouble(String? value) {
  if (value == null) return 0;

  try {
    return double.parse(value);
  } catch (e) {
    return 0;
  }
}

// string -> int
int stringToConvertInt(String? value) {
  if (value == null) return 0;

  try {
    return int.parse(value);
  } catch (e) {
    return 0;
  }
}

// date -> string
String dateToString(DateTime? date) {
  DateTime yesterday = DateTime.now().subtract(const Duration(hours: 30));

  return DateFormat('yyyy-MM-dd').format(date ?? yesterday);
}

String formatSeconds(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;

  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return "$minutesStr분 $secondsStr초";
}
