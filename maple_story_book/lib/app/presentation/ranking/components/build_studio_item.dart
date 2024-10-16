import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/core/enum/enum.dart';
import 'package:maple_story_book/core/extension/int_extension.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/component.dart';

Widget studioTabView(List<RankingStudioElement>? rankList) {
  if (rankList == null) return MSEmpty();
  return SingleChildScrollView(
    child: Column(
      children: [
        // index < 3 인 경우
        GridView.custom(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisExtent: 260,
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
              return buildStudioItem(rank, index);
            }).toList(),
          ),
        ),

        DataTable(
          border: TableBorder.all(color: Colors.grey),
          columnSpacing: 10.0,
          dataRowMinHeight: 20,
          dataRowMaxHeight: 30,
          headingRowHeight: 40,
          dataTextStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
          columns: const [
            DataColumn(
              label: Text('랭킹'),
              numeric: true,
            ),
            DataColumn(label: Text('서버')),
            DataColumn(label: Text('직업')),
            DataColumn(label: Text('이름')),
            DataColumn(label: Text('레벨')),
            DataColumn(label: Text('도달층')),
            DataColumn(label: Text('기록')),
          ],
          rows: rankList.map((data) {
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    '${(data.ranking + 3).toString()}위',
                    textAlign: TextAlign.right,
                  ),
                ),
                DataCell(
                  Text(
                    data.worldName,
                    textAlign: TextAlign.right,
                  ),
                ),
                DataCell(
                  Text(
                    data.characterName,
                    textAlign: TextAlign.right,
                  ),
                ),
                DataCell(Text(
                  '${data.className} / ${data.subClassName}',
                  textAlign: TextAlign.right,
                )),
                DataCell(Text(
                  data.characterLevel.toString(),
                  textAlign: TextAlign.right,
                )),
                DataCell(
                  Text(
                    data.studioFloor.toString(),
                    textAlign: TextAlign.right,
                  ),
                ),
                DataCell(
                  Text(
                    data.studioTimeRecord.toIntFormatTime(),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    ),
  );
}

Widget buildStudioItem(RankingStudioElement rank, int index) {
  WorldImage worldImagePath = WorldImage.getWorldImage(rank.worldName);

  return Padding(
    padding: AppInset.edgeInsetsValue([10, 5]),
    child: Column(
      children: [
        if (index < 3) ...[
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
              child: Center(child: Text('${rank.ranking.toString()}위')),
            ),
          ),
        ],
        AppSize.size2,
        Container(
          decoration: BoxDecoration(
              color: const Color(0xFFDFDDC7).withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFFDFDDC7))),
          child: Row(
            mainAxisAlignment:
                index < 3 ? MainAxisAlignment.center : MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  if (index < 3) ...[
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
                    Row(
                      children: [
                        const Text('서버 : '),
                        Image.asset(
                          worldImagePath.name,
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                    Text(rank.characterName),
                    Text(
                        '${rank.className} / ${rank.subClassName == '' ? rank.className : rank.subClassName}'),
                    Row(
                      children: [
                        const Text('기록 : '),
                        Text(rank.studioTimeRecord.toIntFormatTime()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('도달 층 : '),
                        Text(rank.studioFloor.toString()),
                      ],
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
