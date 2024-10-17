import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/common/util/filter_job_name.dart';
import 'package:maple_story_book/app/presentation/ranking/components/components.dart';
import 'package:maple_story_book/app/presentation/ranking/widgets/widgets.dart';
import 'package:maple_story_book/core/enum/enum.dart';
import 'package:maple_story_book/core/extension/extension.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

Widget unionTabView(List<RankingUnionElement>? rankList) {
  return rankingTabViewTemplate<RankingUnionElement>(
    rankList: rankList,
    isUnion: false,
    columns: const [
      DataColumn(label: Expanded(child: Center(child: MSText('랭킹', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('월드', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('유니온레벨', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('전투력', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('이름', fontSize: 14)))),
    ],
    buildCellList: (data) => [
      DataCell(Center(child: MSText(data.ranking.toString(), fontSize: 14))),
      DataCell(
        Center(
          child: Image.asset(
            WorldImage.getWorldImage(data.worldName).name,
            width: 25,
            height: 25,
          ),
        ),
      ),
      DataCell(Center(child: MSText(data.unionLevel.toCommaString(), fontSize: 14))),
      DataCell(Center(child: MSText(data.unionPower.toCommaString(), fontSize: 14))),
      DataCell(Center(child: MSText(data.characterName, fontSize: 14))),
    ],
    topRanker: unionTopItem,
  );
}

Widget unionTopItem(RankingUnionElement rank, int index) {
  return topRankerItemTemplate<RankingUnionElement>(
    rank: rank,
    index: index,
    bottomInfo: [
      MSText('레벨 : ${rank.unionLevel.toCommaString()}', fontSize: 14),
    ],
    characterName: rank.characterName,
    centerInfo: filterJobName(rank.subClassName == '' ? rank.className : rank.subClassName),
    worldName: rank.worldName,
    ranking: rank.ranking,
  );
}
