import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/common/util/filter_job_name.dart';
import 'package:maple_story_book/app/presentation/ranking/components/components.dart';
import 'package:maple_story_book/app/presentation/ranking/widgets/widgets.dart';
import 'package:maple_story_book/core/enum/enum.dart';
import 'package:maple_story_book/core/extension/extension.dart';
import 'package:maple_story_book/tool/widget/maple_story_text.dart';

Widget studioTabView(List<RankingStudioElement>? rankList) {
  return rankingTabViewTemplate<RankingStudioElement>(
    rankList: rankList,
    columns: const [
      DataColumn(
          label: Expanded(child: Center(child: MSText('랭킹', fontSize: 14)))),
      DataColumn(
          label: Expanded(child: Center(child: MSText('월드', fontSize: 14)))),
      DataColumn(
          label: Expanded(child: Center(child: MSText('이름', fontSize: 14)))),
      DataColumn(
          label: Expanded(child: Center(child: MSText('직업', fontSize: 14)))),
      DataColumn(
          label: Expanded(child: Center(child: MSText('도달층', fontSize: 14)))),
      DataColumn(
          label: Expanded(child: Center(child: MSText('기록', fontSize: 14)))),
    ],
    buildCellList: (data) => [
      DataCell(
        Center(
          child: MSText(
            data.ranking.toString(),
            fontSize: 14,
          ),
        ),
      ),
      DataCell(
        Center(
          child: Center(
            child: Image.asset(
              WorldImage.getWorldImage(data.worldName).name,
              width: 25,
              height: 25,
            ),
          ),
        ),
      ),
      DataCell(
        Center(
          child: MSText(
            data.characterName,
            fontSize: 14,
          ),
        ),
      ),
      DataCell(
        Center(
          child: MSText(
            filterJobName(
                data.subClassName == '' ? data.className : data.subClassName),
            fontSize: 14,
          ),
        ),
      ),
      DataCell(
        Center(
          child: MSText(
            data.studioFloor.toString(),
            fontSize: 14,
          ),
        ),
      ),
      DataCell(
        Center(
          child: MSText(
            data.studioTimeRecord.toIntFormatTime(),
            fontSize: 14,
          ),
        ),
      ),
    ],
    topRanker: studioTopItem,
  );
}

Widget studioTopItem(RankingStudioElement rank, int index) {
  return topRankerItemTemplate<RankingStudioElement>(
    rank: rank,
    index: index,
    bottomInfo: [
      MSText('기록 : ${rank.studioTimeRecord.toIntFormatTime()}', fontSize: 14),
      MSText('도달층 : ${rank.studioFloor}', fontSize: 14),
    ],
    characterName: rank.characterName,
    centerInfo: filterJobName(
        rank.subClassName == '' ? rank.className : rank.subClassName),
    worldName: rank.worldName,
    ranking: rank.ranking,
  );
}
