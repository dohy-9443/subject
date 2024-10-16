///
/// @Project name    : maple_story_book
/// @Class           : int_extension.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 16..
/// Description      :
///

extension IntFormatting on int {
  String toCommaString() {
    return this.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',');
  }

  String toPercentageString() {
    return '${this.toStringAsFixed(2)}%';
  }

  String toIntFormatTime() {
    int minutes = this ~/ 60;
    int seconds = this % 60;

    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = seconds.toString().padLeft(2, '0');

    return '$formattedMinutes분 $formattedSeconds초';
  }
}