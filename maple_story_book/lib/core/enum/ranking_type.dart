///
/// @Project name    : maple_story_book
/// @Class           : ranking_type.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 24..
/// Description      :
///
///
///
enum RankingType {
  zero(num: 0, name: '주간 명성치'),
  one(num: 1, name: '플래그 레이스'),
  two(num: 2, name: '지하 수로');

  final int num;
  final String name;

  const RankingType({required this.num, required this.name});

  static RankingType getRankingType(String name) {
    switch (name) {
      case 'zero':
        return RankingType.zero;
      case 'one':
        return RankingType.one;
      case 'two':
        return RankingType.two;
      default:
        throw Exception('Invalid RankingType : $name');
    }
  }
}


