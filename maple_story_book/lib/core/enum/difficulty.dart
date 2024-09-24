///
/// @Project name    : maple_story_book
/// @Class           : difficulty.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 24..
/// Description      :
///
///
enum Difficulty {
  zero(num: 0, name: '일반'),
  one(num: 1, name: '통달');

  final int num;
  final String name;

  const Difficulty({required this.num, required this.name});

  static Difficulty getDifficulty(String name) {
    switch (name) {
      case 'zero':
        return Difficulty.zero;
      case 'one':
        return Difficulty.one;
      default:
        throw Exception('Invalid Difficulty : $name');
    }
  }
}
