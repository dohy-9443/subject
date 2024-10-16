import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/components/components.dart';
import 'package:maple_story_book/core/util/util.dart';

Widget template<T>(List<T>? list) {
  if (list is RankingAchievement) {}
  if (list is RankingTheSeed) {}
  if (list is RankingStudio) {}
  if (list is RankingGuild) {}
  if (list is RankingUnion) {}
  if (list is RankingOverall) {}

  return Padding(
    padding: AppInset.all8,
    child: Column(
      children: [
        topRanker(),
        rankerList<T>(list ?? []),
        filterButton(),
        bottomRecord(),
      ],
    ),
  );
}

