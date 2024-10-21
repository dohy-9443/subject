import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/view/home_stat.dart';
import 'package:maple_story_book/app/presentation/ranking/components/components.dart';
import 'package:maple_story_book/app/presentation/ranking/widgets/widgets.dart';
import 'package:maple_story_book/core/enum/enum.dart';
import 'package:maple_story_book/core/extension/extension.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

Widget guildTabView(List<RankingGuildElement>? rankList) {
  return rankingTabViewTemplate<RankingGuildElement>(
    rankList: rankList,
    isGuild: true,
    columns: const [
      DataColumn(label: Expanded(child: Center(child: MSText('랭킹', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('월드', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('길드이름', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('포인트', fontSize: 14)))),
      DataColumn(label: Expanded(child: Center(child: MSText('길드마스터', fontSize: 14)))),
    ],
    buildCellList: (data) => [
      DataCell(Center(child: MSText(data.ranking.toString(), textAlign: TextAlign.right, fontSize: 14))),
      DataCell(
        Center(
          child: Image.asset(
            WorldImage.getWorldImage(data.worldName).name,
            width: 25,
            height: 25,
          ),
        ),
      ),
      DataCell(Center(child: MSText(data.guildName, fontSize: 14))),
      DataCell(Center(child: MSText(data.guildPoint.toCommaString(), fontSize: 14))),
      DataCell(Center(child: MSText(data.guildMasterName, fontSize: 14))),
    ],
    topRanker: guildTopItem,
  );
}

Widget guildTopItem(RankingGuildElement rank, int index) {
  return topRankerItemTemplate<RankingGuildElement>(
    isGuild: true,
    rank: rank,
    index: index,
    bottomInfo: [
      MSText('길드: ${rank.guildName}', fontSize: 14),
      MSText('레벨: ${rank.guildLevel}', fontSize: 14),
      MSText('포인트: ${rank.guildPoint.toCommaString()}', fontSize: 14),
    ],
    characterName: rank.guildName,
    centerInfo: rank.guildMasterName,
    worldName: rank.worldName,
    ranking: rank.ranking,
  );
}
