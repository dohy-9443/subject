import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/core/extension/double_formatting.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_center.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 14..
/// Description      : 
///

class HomeCenter extends StatelessWidget {
  final Stat stat;

  const HomeCenter({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    print("stat.characterClass : ${stat.characterClass}");
    print("");
    print("stat.finalStat : ${stat.finalStat}");
    print("");
    print("");
    processStatElements(stat.finalStat);

    return const Placeholder();
  }
}

void processStatElements(List<StatElement> statElements) {
  for (var stat in statElements) {
    switch (stat.statName) {
      case 'HP':
        print('HP : ${stat.statValue.toCommaString()}');
        break;
      case '최소 스탯공격력':
        print('최소 스탯공격력: ${stat.statValue.numberToKorean()}');
        break;
      case '최대 스탯공격력':
        print('최대 스탯공격력: ${stat.statValue.numberToKorean()}');
        break;
      case '데미지':
        print('데미지: ${stat.statValue.toPercentageString()}');
        break;
      case '최종 데미지':
        print('최종 데미지: ${stat.statValue.toPercentageString()}');
        break;
      default:
        print("");
    }
  }
}