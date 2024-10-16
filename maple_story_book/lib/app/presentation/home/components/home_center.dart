import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/core/extension/double_formatting.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/maple_story_text.dart';
import 'package:maple_story_book/tool/widget/maple_stroy_button.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_center.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 14..
/// Description      :
///

class HomeCenter extends StatefulWidget {
  final Stat stat;
  final HyperStat hyperStat;
  final Ability ability;

  const HomeCenter({super.key, required this.stat, required this.hyperStat, required this.ability});

  @override
  State<HomeCenter> createState() => _HomeCenterState();
}

class _HomeCenterState extends State<HomeCenter> {
  bool _isHyperStatSelected = false;
  bool _isAbilitySelected = false;

  @override
  Widget build(BuildContext context) {

    List<Widget> hyperStatList = [
      Column(
        children: widget.hyperStat.hyperStatPreset1.map((el) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSText.bold(el.statType, color: ColorName.white,),
                  MSText.bold('Lv. ${el.statLevel}', color: ColorName.white,)
                ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSText.bold(el.statType, color: ColorName.white,),
                  MSText.bold('Lv. ${el.statLevel}', color: ColorName.white,)
                ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSText.bold(el.statType, color: ColorName.white,),
                  MSText.bold('Lv. ${el.statLevel}', color: ColorName.white,)
                ],
              ),
              AppSize.height(4),
            ],
          );
        }).toList(),
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
          Container(
            padding: AppInset.all8,
            decoration: BoxDecoration(
              color: ColorName.darkModal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MSText.bold('전투력', color: ColorName.white, fontSize: 20,),
                MSText.bold(statValuePrint(name: '전투력'), color: Colors.white, fontSize: 20,)
              ],
            ),
          ),
          AppSize.height(8),
          // 기본 스텟 6스텟
          Container(
            padding: AppInset.all8,
            decoration: BoxDecoration(
              color: ColorName.lightGray1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      AppSize.height(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MSText.bold('HP', color: ColorName.white,),
                          MSText.basic(statValuePrint(name: 'HP'), color: ColorName.white,)
                        ],
                      ),
                      AppSize.height(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MSText.bold('STR', color: ColorName.white,),
                          MSText.basic(statValuePrint(name: 'STR'), color: ColorName.white,)
                        ],
                      ),
                      AppSize.height(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MSText.bold('INT', color: ColorName.white,),
                          MSText.basic(statValuePrint(name: 'INT'), color: ColorName.white,)
                        ],
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MSText.bold('MP', color: ColorName.white,),
                          MSText.basic(statValuePrint(name: 'MP'), color: ColorName.white,)
                        ],
                      ),
                      AppSize.height(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MSText.bold('DEX', color: ColorName.white,),
                          MSText.basic(statValuePrint(name: 'DEX'), color: ColorName.white,)
                        ],
                      ),
                      AppSize.height(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MSText.bold('LUK', color: ColorName.white,),
                          MSText.basic(statValuePrint(name: 'LUK'), color: ColorName.white,)
                        ],
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
          Container(
            padding: AppInset.all8,
            decoration: BoxDecoration(
              color: ColorName.lightGray3,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('최소 스탯공격력', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '최소 스탯공격력'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('최대 스탯공격력', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '최대 스탯공격력'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('최종 데미지', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '최종 데미지'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('방어율 무시', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '방어율 무시'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('공격력', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '공격력'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('마력', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '마력'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('재사용 대기시간 감소', color: ColorName.white,),
                    MSText.basic('${statValuePrint(name: '재사용 대기시간 감소 (초)')}초 / ${statValuePrint(name: '재사용 대기시간 감소 (%)')}%', color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('재사용 대기시간 미적용', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '재사용 대기시간 미적용'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('상태이상 추가 데미지', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '상태이상 추가 데미지'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('데미지', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '데미지'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('보스 몬스터 데미지', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '보스 몬스터 데미지'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('일반 몬스터 데미지', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '일반 몬스터 데미지'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('크리티컬 확률', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '크리티컬 확률'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('크리티컬 데미지', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '크리티컬 데미지'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('버프 지속시간', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '버프 지속시간'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('속성 내성 무시', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '속성 내성 무시'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('소환수 지속시간 증가', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '소환수 지속시간 증가'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
              ],
            ),
          ),
          AppSize.height(8),
          // 기타
          Container(
            padding: AppInset.all8,
            decoration: BoxDecoration(
              color: ColorName.lightGray3,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('메소 획득량', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '메소 획득량'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('아이템 드롭률', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '아이템 드롭률'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('추가 경험치 획득', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '추가 경험치 획득'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('스타포스', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '스타포스'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('아케인포스', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '아케인포스'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('어센틱포스', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '어센틱포스'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('방어력', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '방어력'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('이동속도', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '이동속도'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('스탠스', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '스탠스'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('상태이상 내성', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '상태이상 내성'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('점프력', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '점프력'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSText.bold('공격 속도', color: ColorName.white,),
                    MSText.basic(statValuePrint(name: '공격 속도'), color: ColorName.white,)
                  ],
                ),
                AppSize.height(4),
              ],
            ),
          ),
          AppSize.height(8),
          // 하이퍼 스텟, 어빌리티 버튼
          Row(
            children: [
              Expanded(
                child: MSButton.gradient(
                  onPressed: () {
                    context.read<HomeBloc>().add(GetHomeEvent<HyperStat>(ocid: "36c54981582f63ef732f51a1216299d2"));
                    setState(() {
                      _isHyperStatSelected = !_isHyperStatSelected;
                    });
                  },
                  child: MSText.bold('하이퍼 스텟', color: ColorName.lightModeDarkMode, fontSize: 20,),
                  width: 150,
                  height: 50,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [ColorName.lightBtn, ColorName.mainAccent],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              AppSize.width(8),
              Expanded(
                child: MSButton.gradient(
                  onPressed: () {
                    context.read<HomeBloc>().add(GetHomeEvent<Ability>(ocid: "36c54981582f63ef732f51a1216299d2"));
                    setState(() {
                      _isAbilitySelected = !_isAbilitySelected;
                    });
                  },
                  child: MSText.bold('어빌리티', color: ColorName.white, fontSize: 20,),
                  width: 150,
                  height: 50,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [ColorName.darkModal, ColorName.modal],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          AppSize.height(16),
          // 하이퍼 스텟
          _isHyperStatSelected ? Column(
            children: [
              // 하이퍼 스텟 , 창닫기
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
                        onTap: () {},
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
                    return Container(
                      padding: AppInset.all8,
                      margin: AppInset.edgeInsetsValue([0, 4]),
                      decoration: BoxDecoration(
                        color: ColorName.lightGray1,
                        borderRadius: BorderRadius.circular(10),
                      ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSText.bold('어빌리티', fontSize: 25, color: ColorName.white,),
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
                          onTap: () {},
                          child: MSText.bold('X', color: ColorName.white, textAlign: TextAlign.center,),
                        ),
                      )
                  ),
                ],
              ),
              AppSize.height(16),
              // 어빌리티 슬라이드
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
                    return Container(
                      padding: AppInset.all8,
                      margin: AppInset.edgeInsetsValue([0, 4]),
                      decoration: BoxDecoration(
                        color: ColorName.lightGray1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: hyperStatList[index],
                    );
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
}
