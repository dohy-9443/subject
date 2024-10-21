import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/view/home_stat.dart';
import 'package:maple_story_book/app/presentation/ranking/common/util/filter_job_name.dart';
import 'package:maple_story_book/app/presentation/ranking/components/components.dart';
import 'package:maple_story_book/app/presentation/ranking/widgets/widgets.dart';
import 'package:maple_story_book/core/enum/enum.dart';
import 'package:maple_story_book/core/extension/extension.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

class OverallTabView extends StatefulWidget {
  final List<RankingOverallElement>? rankList;

  const OverallTabView(
    this.rankList, {
    super.key,
  });

  @override
  State<OverallTabView> createState() => _OverallTabViewState();
}

class _OverallTabViewState extends State<OverallTabView> {
  @override
  Widget build(BuildContext context) {
    return rankingTabViewTemplate<RankingOverallElement>(
      rankList: widget.rankList,
      columns: const [
        DataColumn(
            label: Expanded(child: Center(child: MSText('랭킹', fontSize: 14)))),
        DataColumn(
            label: Expanded(child: Center(child: MSText('서버', fontSize: 14)))),
        DataColumn(
            label: Expanded(child: Center(child: MSText('이름', fontSize: 14)))),
        DataColumn(
            label: Expanded(child: Center(child: MSText('직업', fontSize: 14)))),
        DataColumn(
            label: Expanded(child: Center(child: MSText('레벨', fontSize: 14)))),
      ],
      buildCellList: (data) => [
        DataCell(MSText(data.ranking.toString(), fontSize: 14)),
        DataCell(
          Image.asset(
            WorldImage.getWorldImage(data.worldName).name,
            width: 25,
            height: 25,
          ),
        ),
        DataCell(Center(child: MSText(data.characterName, fontSize: 14))),
        DataCell(Center(
            child: MSText(
                filterJobName(data.subClassName == ''
                    ? data.className
                    : data.subClassName),
                fontSize: 14))),
        DataCell(Center(
            child: MSText(data.characterLevel.toString(), fontSize: 14))),
      ],
      topRanker: overallTopItem,
    );
  }
}

Widget overallTopItem(RankingOverallElement rank, int index) {
  return topRankerItemTemplate<RankingOverallElement>(
    rank: rank,
    index: index,
    bottomInfo: [
      MSText('레벨: ${rank.characterLevel}', fontSize: 14),
      MSText('인기도: ${rank.characterPopularity.toCommaString()}', fontSize: 14),
    ],
    characterName: rank.characterName,
    centerInfo: filterJobName(
        rank.subClassName == '' ? rank.className : rank.subClassName),
    worldName: rank.worldName,
    ranking: rank.ranking,
  );
}
