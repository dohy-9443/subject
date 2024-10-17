import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/common/util/filter_job_name.dart';
import 'package:maple_story_book/app/presentation/ranking/components/components.dart';
import 'package:maple_story_book/app/presentation/ranking/widgets/widgets.dart';
import 'package:maple_story_book/core/enum/enum.dart';
import 'package:maple_story_book/core/extension/extension.dart';
import 'package:maple_story_book/tool/widget/maple_story_text.dart';

Widget theSeedTabView(List<RankingTheSeedElement>? rankList) {
  return rankingTabViewTemplate<RankingTheSeedElement>(
    rankList: rankList,
    columns: const [
      DataColumn(label: Expanded(child: Center(child: MSText('랭킹', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('월드', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('이름', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('직업', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('도달층', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('기록', fontSize: 14)))),
    ],
    buildCellList: (data) => [
      DataCell(Center(child: MSText(data.ranking.toString(), fontSize: 14))),
      DataCell(
        Image.asset(
          WorldImage.getWorldImage(data.worldName).name,
          width: 25,
          height: 25,
        ),
      ),
      DataCell(Center(child: MSText(data.characterName, fontSize: 14))),
      DataCell(
        Center(
          child: MSText(
            filterJobName(data.subClassName == '' ? data.className : data.subClassName),
            fontSize: 14,
          ),
        ),
      ),
      DataCell(
        Center(
          child: MSText(
            data.theSeedFloor.toString(),
            fontSize: 14,
          ),
        ),
      ),
      DataCell(
        Center(
          child: MSText(
            data.theSeedTimeRecord.toIntFormatTime(),
            fontSize: 14,
          ),
        ),
      ),
    ],
    topRanker: theSeedTopItem,
  );
}

Widget theSeedTopItem(RankingTheSeedElement rank, int index) {
  return topRankerItemTemplate<RankingTheSeedElement>(
    rank: rank,
    index: index,
    bottomInfo: [
      MSText('도달층 : ${rank.theSeedFloor}', fontSize: 14),
      MSText('기록 : ${rank.theSeedTimeRecord.toIntFormatTime()}', fontSize: 14),
    ],
    characterName: rank.characterName,
    centerInfo: filterJobName(rank.subClassName == '' ? rank.className : rank.subClassName),
    worldName: rank.worldName,
    ranking: rank.ranking,
  );
}
