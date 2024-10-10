import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : studio_table_row.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 10..
/// Description      :
///

TableRow buildTableRowItem(RankingStudioElement rank) {
  return TableRow(
    children: [
      TableCell(
        child: MSText.bold(
          '${rank.ranking.toString()} 위',
          color: const Color(0xFF684B3E),
          fontSize: 14,
        ),
      ),
      TableCell(
        child: MSText.basic(
          rank.characterName,
          color: const Color(0xFF684B3E),
          fontSize: 15,
        ),
      ),
      TableCell(
        child: MSText.basic(
          rank.subClassName,
          color: const Color(0xFF684B3E),
          fontSize: 15,
        ),
      ),
      TableCell(
        child: MSText.bold(
          'LV ${rank.characterLevel.toString()}',
          color: const Color(0xFF684B3E),
          fontSize: 14,
        ),
      ),
      TableCell(
        child: MSText.basic(
          '${rank.studioFloor.toString()}층',
          color: const Color(0xFF684B3E),
          fontSize: 15,
        ),
      ),
      TableCell(
        child: MSText.basic(
          '${formatSeconds(rank.studioTimeRecord)} ',
          color: const Color(0xFF684B3E),
          fontSize: 15,
        ),
      ),
    ],
  );
}