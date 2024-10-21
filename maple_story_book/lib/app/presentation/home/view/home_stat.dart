import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/components/components.dart';
import 'package:maple_story_book/core/extension/double_formatting.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/component.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/maple_story_round_button.dart';
import 'package:maple_story_book/tool/widget/maple_story_text.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_center.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 14..
/// Description      :
///

class HomeStat extends StatefulWidget {
  final Stat stat;
  final HyperStat hyperStat;
  final Ability ability;

  const HomeStat({super.key, required this.stat, required this.hyperStat, required this.ability});

  @override
  State<HomeStat> createState() => _HomeStatState();
}

class _HomeStatState extends State<HomeStat> {
  bool _isHyperStatSelected = false;
  bool _isAbilitySelected = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> hyperStatList = [
      Column(
        children: widget.hyperStat.hyperStatPreset1.map((el) {
          return Column(
            children: [
              SpaceBetweenText(
                title: el.statType,
                content: 'Lv. ${el.statLevel}',
              ),
              AppSize.height(4),
            ],
          );
        }).toList(),
      ),
      Column(
        children: widget.hyperStat.hyperStatPreset2.map((el) {
          return Column(
            children: [
              SpaceBetweenText(
                title: el.statType,
                content: 'Lv. ${el.statLevel}',
              ),
              AppSize.height(4),
            ],
          );
        }).toList(),
      ),
      Column(
        children: widget.hyperStat.hyperStatPreset3.map((el) {
          return Column(
            children: [
              SpaceBetweenText(
                title: el.statType,
                content: 'Lv. ${el.statLevel}',
              ),
              AppSize.height(4),
            ],
          );
        }).toList(),
      ),
    ];

    List<Widget> abilityList = [
      Container(
        padding: AppInset.all8,
        decoration: BoxDecoration(
          color: ColorName.lightGray3,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              padding: AppInset.edgeInsetsValue([4, 8]),
              decoration: BoxDecoration(
                color: abilityColor(grade: widget.ability.abilityPreset1!.abilityPresetGrade),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    String.fromCharCode(Icons.bookmark.codePoint),
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: Icons.bookmark.fontFamily,
                      color: ColorName.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(-2.0, -2.0),
                        ),
                      ],
                    ),
                  ),
                  AppSize.width(4),
                  MSText.bold(
                    '${widget.ability.abilityPreset1.abilityPresetGrade} 어빌리티', color: ColorName.white, fontSize: 20,
                    shadow: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(-1.0, -1.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            AppSize.height(8),
            ...widget.ability.abilityPreset1.abilityInfo.mapIndexed((index, el) {
              return Column(
                children: [
                  Container(
                    height: 40,
                    padding: AppInset.edgeInsetsValue([4, 8]),
                    decoration: BoxDecoration(
                      color: abilityColor(grade: el.abilityGrade),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MSText.bold(
                          el.abilityValue,
                          color: ColorName.white,
                        ),
                      ],
                    ),
                  ),
                  if (widget.ability.abilityPreset1.abilityInfo.length - 1 != index) AppSize.height(6)
                ],
              );
            }),
          ],
        ),
      ),
      Container(
        padding: AppInset.all8,
        decoration: BoxDecoration(
          color: ColorName.lightGray3,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              padding: AppInset.edgeInsetsValue([4, 8]),
              decoration: BoxDecoration(
                color: abilityColor(grade: widget.ability.abilityPreset2.abilityPresetGrade),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    String.fromCharCode(Icons.bookmark.codePoint),
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: Icons.bookmark.fontFamily,
                      color: ColorName.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(-2.0, -2.0),
                        ),
                      ],
                    ),
                  ),
                  AppSize.width(4),
                  MSText.bold(
                    '${widget.ability.abilityPreset2.abilityPresetGrade} 어빌리티', color: ColorName.white, fontSize: 20,
                    shadow: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(-1.0, -1.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            AppSize.height(8),
            ...widget.ability.abilityPreset2.abilityInfo.mapIndexed((index, el) {
              return Column(
                children: [
                  Container(
                    height: 40,
                    padding: AppInset.edgeInsetsValue([4, 8]),
                    decoration: BoxDecoration(
                      color: abilityColor(grade: el.abilityGrade),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MSText.bold(
                          el.abilityValue,
                          color: ColorName.white,
                        ),
                      ],
                    ),
                  ),
                  if (widget.ability.abilityPreset2.abilityInfo.length - 1 != index) AppSize.height(6)
                ],
              );
            }),
          ],
        ),
      ),
      Container(
        padding: AppInset.all8,
        decoration: BoxDecoration(
          color: ColorName.lightGray3,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              padding: AppInset.edgeInsetsValue([4, 8]),
              decoration: BoxDecoration(
                color: abilityColor(grade: widget.ability.abilityPreset3.abilityPresetGrade),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    String.fromCharCode(Icons.bookmark.codePoint),
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: Icons.bookmark.fontFamily,
                      color: ColorName.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(-2.0, -2.0),
                        ),
                      ],
                    ),
                  ),
                  AppSize.width(4),
                  MSText.bold(
                    '${widget.ability.abilityPreset3.abilityPresetGrade} 어빌리티', color: ColorName.white, fontSize: 20,
                    shadow: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(-1.0, -1.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            AppSize.height(8),
            ...widget.ability.abilityPreset3!.abilityInfo.mapIndexed((index, el) {
              return Column(
                children: [
                  Container(
                    height: 40,
                    padding: AppInset.edgeInsetsValue([4, 8]),
                    decoration: BoxDecoration(
                      color: abilityColor(grade: el.abilityGrade),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MSText.bold(
                          el.abilityValue,
                          color: ColorName.white,
                        ),
                      ],
                    ),
                  ),
                  if (widget.ability.abilityPreset3.abilityInfo.length - 1 != index) AppSize.height(6)
                ],
              );
            }),
          ],
        ),
      ),
    ];

    return Container(
      padding: AppInset.all8,
      decoration: BoxDecoration(
        color: ColorName.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // 전투력
          RoundSquare(
            backgroundColor: ColorName.darkModal,
            child: SpaceBetweenText(
              title: '전투력',
              titleSize: 20,
              content: statValuePrint(name: '전투력'),
              contentSize: 20,
            ),
          ),
          AppSize.height(8),
          // 기본 스텟 6스텟
          RoundSquare(
            backgroundColor: ColorName.lightGray1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      AppSize.height(4),
                      SpaceBetweenText(
                        title: 'HP',
                        content: statValuePrint(name: 'HP'),
                        contentType: SizeType.basic,
                      ),
                      AppSize.height(4),
                      SpaceBetweenText(
                        title: 'STR',
                        content: statValuePrint(name: 'STR'),
                        contentType: SizeType.basic,
                      ),
                      AppSize.height(4),
                      SpaceBetweenText(
                        title: 'INT',
                        content: statValuePrint(name: 'INT'),
                        contentType: SizeType.basic,
                      ),
                      AppSize.height(4),
                    ],
                  ),
                ),
                AppSize.width(8),
                Expanded(
                  child: Column(
                    children: [
                      AppSize.height(4),
                      SpaceBetweenText(
                        title: 'MP',
                        content: statValuePrint(name: 'MP'),
                        contentType: SizeType.basic,
                      ),
                      AppSize.height(4),
                      SpaceBetweenText(
                        title: 'DEX',
                        content: statValuePrint(name: 'DEX'),
                        contentType: SizeType.basic,
                      ),
                      AppSize.height(4),
                      SpaceBetweenText(
                        title: 'LUK',
                        content: statValuePrint(name: 'LUK'),
                        contentType: SizeType.basic,
                      ),
                      AppSize.height(4),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppSize.height(8),
          // 그 외 옵션으로 올라가는 스텟
          RoundSquare(
            backgroundColor: ColorName.lightGray3,
            child: Column(
              children: [
                AppSize.height(4),
                SpaceBetweenText(
                  title: '최소 스탯공격력',
                  content: statValuePrint(name: '최소 스탯공격력'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '최대 스탯공격력',
                  content: statValuePrint(name: '최대 스탯공격력'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '최종 데미지',
                  content: statValuePrint(name: '최종 데미지'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '방어율 무시',
                  content: statValuePrint(name: '방어율 무시'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '공격력',
                  content: statValuePrint(name: '공격력'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '마력',
                  content: statValuePrint(name: '마력'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '재사용 대기시간 감소',
                  content: '${statValuePrint(name: '재사용 대기시간 감소 (초)')}초 / ${statValuePrint(name: '재사용 대기시간 감소 (%)')}%',
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '재사용 대기시간 미적용',
                  content: statValuePrint(name: '재사용 대기시간 미적용'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '상태이상 추가 데미지',
                  content: statValuePrint(name: '상태이상 추가 데미지'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '데미지',
                  content: statValuePrint(name: '데미지'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '보스 몬스터 데미지',
                  content: statValuePrint(name: '보스 몬스터 데미지'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '일반 몬스터 데미지',
                  content: statValuePrint(name: '일반 몬스터 데미지'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '크리티컬 확률',
                  content: statValuePrint(name: '크리티컬 확률'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '크리티컬 데미지',
                  content: statValuePrint(name: '크리티컬 데미지'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '버프 지속시간',
                  content: statValuePrint(name: '버프 지속시간'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '속성 내성 무시',
                  content: statValuePrint(name: '속성 내성 무시'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '소환수 지속시간 증가',
                  content: statValuePrint(name: '소환수 지속시간 증가'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
              ],
            ),
          ),
          AppSize.height(8),
          // 기타
          RoundSquare(
            backgroundColor: ColorName.lightGray3,
            child: Column(
              children: [
                AppSize.height(4),
                SpaceBetweenText(
                  title: '메소 획득량',
                  content: statValuePrint(name: '메소 획득량'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '아이템 드롭률',
                  content: statValuePrint(name: '아이템 드롭률'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '추가 경험치 획득',
                  content: statValuePrint(name: '추가 경험치 획득'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '스타포스',
                  content: statValuePrint(name: '스타포스'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '아케인포스',
                  content: statValuePrint(name: '아케인포스'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '어센틱포스',
                  content: statValuePrint(name: '어센틱포스'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '방어력',
                  content: statValuePrint(name: '방어력'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '이동속도',
                  content: statValuePrint(name: '이동속도'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '스탠스',
                  content: statValuePrint(name: '스탠스'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '상태이상 내성',
                  content: statValuePrint(name: '상태이상 내성'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '점프력',
                  content: statValuePrint(name: '점프력'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
                SpaceBetweenText(
                  title: '공격 속도',
                  content: statValuePrint(name: '공격 속도'),
                  contentType: SizeType.basic,
                ),
                AppSize.height(4),
              ],
            ),
          ),
          AppSize.height(8),
          // 하이퍼 스텟 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MSRoundButton(
                width: 200,
                text: '하이퍼 스텟',
                fontSize: 20,
                fontColor: ColorName.white,
                iconPosition: IconPosition.bottom,
                icon: Icons.double_arrow_rounded,
                iconColor: ColorName.white,
                iconRotation: !_isHyperStatSelected ? 3.14 / 2 : -3.14 / 2,
                onPressed: () {
                  context.read<HomeBloc>().add(GetHomeEvent<HyperStat>(ocid: "36c54981582f63ef732f51a1216299d2"));
                  setState(() {
                    _isHyperStatSelected = !_isHyperStatSelected;
                  });
                  // mSAlert(
                  //   context,
                  //   title: "test alert",
                  //   content: '테스트 입니다.',
                  //   // onPressed: () {},
                  // );
                }
              )
              // AppSize.width(8),
              // Expanded(
              //   child: MSButton.gradient(
              //     onPressed: () {
              //       context.read<HomeBloc>().add(GetHomeEvent<Ability>(ocid: "36c54981582f63ef732f51a1216299d2"));
              //       setState(() {
              //         _isAbilitySelected = !_isAbilitySelected;
              //       });
              //     },
              //     child: MSText.bold('어빌리티', color: ColorName.white, fontSize: 20,),
              //     width: 150,
              //     height: 50,
              //     gradient: const LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [ColorName.darkModal, ColorName.modal],
              //     ),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // ),
            ],
          ),
          // 하이퍼 스텟
          _isHyperStatSelected ? Column(
            children: [
              // 하이퍼 스텟 , 창닫기
              AppSize.height(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSText.bold('하이퍼 스텟', fontSize: 25, color: ColorName.white,),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2, color: ColorName.white)
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isHyperStatSelected = false;
                          });
                        },
                        child: MSText.bold('X', color: ColorName.white, textAlign: TextAlign.center,),
                      ),
                    )
                  ),
                ],
              ),
              AppSize.height(16),
              // 하이퍼 스텟 슬라이드
              SizedBox(
                height: 500,
                child: Swiper(
                  itemCount: hyperStatList.length,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeColor: ColorName.mainAccent,
                      color: ColorName.white,
                    ),
                  ),
                  loop: false,
                  index: widget.hyperStat.usePresetNo - 1,
                  itemBuilder: (BuildContext context, int index) {
                    return RoundSquare(
                      backgroundColor: ColorName.lightGray1,
                      margin: AppInset.edgeInsetsValue([0, 4]),
                      child: hyperStatList[index],
                    );
                  },
                ),
              ),
              AppSize.height(4),
            ],
          ) : SizedBox.shrink(),
          // 어빌리티
          _isAbilitySelected ? Column(
            children: [
              // 어빌리티 , 창닫기
              AppSize.height(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSText.bold('어빌리티', fontSize: 25, color: ColorName.white,),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2, color: ColorName.white),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isAbilitySelected = false;
                          });
                        },
                        child: MSText.bold('X', color: ColorName.white, textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                ],
              ),
              AppSize.height(16),
              // 어빌리티 슬라이드
              SizedBox(
                height: 250,
                child: Swiper(
                  itemCount: abilityList.length,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeColor: ColorName.mainAccent,
                      color: ColorName.white,
                    ),
                  ),
                  loop: false,
                  index: widget.ability.presetNo - 1,
                  itemBuilder: (BuildContext context, int index) {
                    return abilityList[index];
                  },
                ),
              ),
              AppSize.height(4),
            ],
          ) : SizedBox.shrink(),
        ],
      ),
    );
  }

  String statValuePrint({required String name}) {
    final result = widget.stat.finalStat.firstWhere(
          (element) => element.statName == name,
      orElse: () => StatElement(statName: name, statValue: 0),
    );

    switch (result.statName) {
      case 'HP':case 'MP':case 'STR':case 'DEX':case 'INT':case 'LUK':case '방어력':case '스타포스':
      case '상태이상 내성':case '아케인포스':case '어센틱포스':case 'AP 배분 STR':case 'AP 배분 DEX':
      case 'AP 배분 INT':case 'AP 배분 LUK':case 'AP 배분 HP':case 'AP 배분 MP':case '공격력':case '마력':
        return result.statValue.toCommaString();
      case '최소 스탯공격력':case '최대 스탯공격력':case '전투력':
        return result.statValue.numberToKorean();
      case '데미지':case '최종 데미지':case '보스 몬스터 데미지':case '방어율 무시':case '일반 몬스터 데미지':
      case '크리티컬 확률':case '크리티컬 데미지':case '스탠스':case '이동속도':case '점프력':case '아이템 드롭률':
      case '메소 획득량':case '버프 지속시간':case '일반 몬스터 데미지':case '속성 내성 무시':
      case '재사용 대기시간 미적용':case '상태이상 추가 데미지':case '추가 경험치 획득':
        return result.statValue.toPercentageString();
      case '공격 속도':
        return '${result.statValue.toIntString()}단계';
      case '재사용 대기시간 감소 (초)': /// TODO : 재사용 대기시간 감소   0초/ 0% 이렇게 나와야함
        return '${result.statValue.toIntString()}초';
      case '재사용 대기시간 감소 (%)':case '소환수 지속시간 증가':
        return '${result.statValue.toIntString()}%';
      default:
        return "";
    }
  }

  Color abilityColor({ required String grade }) {
    switch (grade) {
      case '레전드리':
        return ColorName.legendaryColor;
      case '유니크':
        return ColorName.uniqueColor;
      case '에픽':
        return ColorName.epicColor;
      case '레어':
        return ColorName.rareColor;
      default:
        return Colors.transparent;
    }
  }
}
