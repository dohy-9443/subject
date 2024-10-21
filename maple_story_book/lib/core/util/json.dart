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
int stringToConvertInt(dynamic value) {

  if (value == null) return 0;
  if (value is int) return value;

  try {
    return int.parse(value.toString());
  } catch (e) {
    return 0;
  }
}

// date -> string
String dateToString(DateTime? date) {
  DateTime yesterday = DateTime.now().subtract(const Duration(hours: 30));

  return DateFormat('yyyy-MM-dd').format(date ?? yesterday);
}