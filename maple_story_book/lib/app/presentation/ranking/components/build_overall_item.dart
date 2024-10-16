import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/core/enum/enum.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/component.dart';
import 'package:collection/collection.dart';

Widget overallTabView(List<RankingOverallElement>? rankList) {
  if (rankList == null) return MSEmpty();
  return SingleChildScrollView(
    child: GridView.custom(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 450, // 메인 가로 크기
        mainAxisExtent: 160, // 메인 세로 크기
        crossAxisSpacing: 16, // 메인 가로 여백
        mainAxisSpacing: 0, // 메인 세로 여백
      ),
      shrinkWrap: true,
      childrenDelegate: SliverChildListDelegate(
        [
          ...rankList.mapIndexed(
                (int index, RankingOverallElement rank) {
              WorldImage worldImagePath =
              WorldImage.getWorldImage(rank.worldName);

              return Padding(
                padding: AppInset.edgeInsetsValue([10, 5]),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: rank.ranking == 1
                              ? Colors.red
                              : rank.ranking == 2
                              ? Colors.orange
                              : rank.ranking == 3
                              ? Colors.blue
                              : Colors.grey,
                          width: 1,
                        ),
                        color: rank.ranking == 1
                            ? Colors.red.withOpacity(0.5)
                            : rank.ranking == 2
                            ? Colors.orange.withOpacity(0.5)
                            : rank.ranking == 3
                            ? Colors.blue.withOpacity(0.5)
                            : Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child:
                        Center(child: Text('${rank.ranking.toString()}위')),
                      ),
                    ),
                    AppSize.size2,
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFDFDDC7).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: const Color(0xFFDFDDC7))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(child: Text('캐릭터')),
                          ),
                          AppSize.width(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    worldImagePath.name,
                                    width: 25,
                                    height: 25,
                                  ),
                                  Text(
                                      '${rank.characterName} / Lv. ${rank.characterLevel.toString()}'),
                                ],
                              ),
                              Visibility(
                                visible: rank.characterGuildName != '',
                                child: Text('길드: ${rank.characterGuildName}'),
                              ),
                              Text(
                                '${rank.className} / ${rank.subClassName == '' ? rank.className : rank.subClassName}',
                              ),
                              Text(
                                  '인기도 : ${rank.characterPopularity.toString()}'),
                              Text('경험치 : ${rank.characterExp.toString()}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}