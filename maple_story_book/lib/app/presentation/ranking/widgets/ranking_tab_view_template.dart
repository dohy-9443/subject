import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/component/component.dart';

Widget rankingTabViewTemplate<T>({
  required List<T>? rankList,
  required List<DataColumn> columns,
  required List<DataCell> Function(T) buildCellList,
  required Widget Function(T rank, int index) topRanker,
  bool isUnion = false,
  bool isGuild = false,
}) {
  if (rankList == null || rankList.isEmpty) return MSEmpty();

  return SingleChildScrollView(
    child: Column(
      children: [
        if(!isUnion)...[
        GridView.custom(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisExtent: isGuild ? 160 : 260,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          shrinkWrap: true,
          childrenDelegate: SliverChildListDelegate(
            rankList
                .asMap()
                .entries
                .where((entry) => entry.key < 3)
                .map((entry) {
              final index = entry.key;
              final rank = entry.value;
              return topRanker(rank, index);
            }).toList(),
          ),
        ),
        ],
        if (isUnion) ...[
          GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 450,
              mainAxisExtent: 160,
              crossAxisSpacing: 16,
              mainAxisSpacing: 0,
            ),
            shrinkWrap: true,
            childrenDelegate: SliverChildListDelegate(
              rankList
                  .asMap()
                  .entries
                  .where((entry) => entry.key < 3)
                  .map((entry) {
                final index = entry.key;
                final rank = entry.value;
                return topRanker(rank, index);
              }).toList(),
            ),
          ),
          // index > 3 인 경우
          GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, // index >= 3 인 경우
              mainAxisExtent: 160,
              crossAxisSpacing: 16,
              mainAxisSpacing: 0,
            ),
            shrinkWrap: true,
            childrenDelegate: SliverChildListDelegate(
              rankList
                  .asMap()
                  .entries
                  .where((entry) => entry.key >= 3)
                  .map((entry) {
                final index = entry.key;
                final rank = entry.value;
                return topRanker(rank, index);
              }).toList(),
            ),
          ),
        ],

        if (!isUnion) ...[
          DataTable(
            columnSpacing: 3.0,
            dataRowMinHeight: 20,
            dataRowMaxHeight: 30,
            headingRowHeight: 40,
            columns: columns,
            rows: rankList.map((data) {
              return DataRow(cells: buildCellList(data));
            }).toList(),
          ),
        ],
      ],
    ),
  );
}

