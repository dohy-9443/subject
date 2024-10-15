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
    print("stat.finalStat : ${stat.finalStat}");
    return const Placeholder();
  }


  String statValuePrint({required String name}) {
    final result = stat.finalStat.firstWhere(
          (element) => element.statName == name,
      orElse: () => StatElement(statName: name, statValue: 0),
    );

    switch (result.statName) {
      case 'HP':case 'MP':case 'STR':case 'DEX':case 'INT':case 'LUK':case '방어력':case '스타포스':
      case '상태이상 내성':case '아케인포스':case '어센틱포스':case 'AP 배분 STR':case 'AP 배분 DEX':
      case 'AP 배분 INT':case 'AP 배분 LUK':case 'AP 배분 HP':case 'AP 배분 MP':
        return result.statValue.toCommaString();
      case '최소 스탯공격력':case '최대 스탯공격력':case '전투력':
        return result.statValue.numberToKorean();
      case '데미지':case '최종 데미지':case '보스 몬스터 데미지':case '방어율 무시':case '일반 몬스터 데미지':
      case '크리티컬 확률':case '크리티컬 데미지':case '스탠스':case '이동속도':case '점프력':case '아이템 드롭률':
      case '메소 획득량':case '버프 지속시간':case '일반 몬스터 데미지':case '속성 내성 무시':case '공격력':
      case '재사용 대기시간 미적용':case '상태이상 추가 데미지':case '추가 경험치 획득':case '마력':
        return result.statValue.toPercentageString();
      case '공격 속도':
        return '${result.statValue.toIntString()}단계';
      case '재사용 대기시간 감소 (초)': // 재사용 대기시간 감소   0초/ 0% 이렇게 나와야함
        return '${result.statValue.toIntString()}초';
      case '재사용 대기시간 감소 (%)':case '소환수 지속시간 증가':
        return '${result.statValue.toIntString()}%';
      default:
        return "";
    }
  }
}
