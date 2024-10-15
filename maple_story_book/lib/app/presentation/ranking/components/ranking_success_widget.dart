import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/widgets/studio_table_row.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_success_widget.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 10..
/// Description      :
///

class RankingSuccessWidget extends StatefulWidget {
  const RankingSuccessWidget({super.key});

  @override
  State<RankingSuccessWidget> createState() => _RankingSuccessWidgetState();
}

class _RankingSuccessWidgetState extends State<RankingSuccessWidget> {
  ScrollController scrollController = ScrollController();

  List<RankingStudioElement> studioList = const [
    RankingStudioElement(
      date: "2024-10-04",
      ranking: 1,
      studioFloor: 94,
      studioTimeRecord: 900,
      characterName: "쥬다잉",
      worldName: "스카니아",
      className: "도적",
      subClassName: "섀도어",
      characterLevel: 290,
    ),
    RankingStudioElement(
      date: "2024-10-04",
      ranking: 2,
      studioFloor: 92,
      studioTimeRecord: 884,
      characterName: "대포",
      worldName: "스카니아",
      className: "해적",
      subClassName: "캐논마스터",
      characterLevel: 291,
    ),
    RankingStudioElement(
      date: "2024-10-04",
      ranking: 1,
      studioFloor: 94,
      studioTimeRecord: 900,
      characterName: "쥬다잉",
      worldName: "스카니아",
      className: "도적",
      subClassName: "섀도어",
      characterLevel: 290,
    ),
    RankingStudioElement(
      date: "2024-10-04",
      ranking: 2,
      studioFloor: 92,
      studioTimeRecord: 884,
      characterName: "대포",
      worldName: "스카니아",
      className: "해적",
      subClassName: "캐논마스터",
      characterLevel: 291,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MSBaseBuildWidget(
      appBar: MSAppBar(
        title: '랭킹',
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 20,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                size: 20,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              size: 20,
            ),
          )
        ],
        // bottom: MSTabBar(
        //   scrollController: scrollController,
        //   tapBarList: [
        //     TapBarType(text: '탭 1'),
        //     TapBarType(onTap: () {}, text: '탭 2'),
        //     TapBarType(onTap: () {}, text: '탭 3'),
        //   ],
        // ),
      ),
      body: Padding(
        padding: AppInset.all8,
        child: Column(
          children: [
            // topRanker
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 127,
                    width: 124,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 127,
                    width: 124,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 127,
                    width: 124,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // _rankerList(),
            Expanded(
              child: Container(
                color: const Color(0xFFDFDDC7),
                child: ListView.builder(
                  itemCount: studioList.length,
                  itemBuilder: (context, index) {
                    return Table(
                      border: const TableBorder(
                        horizontalInside: BorderSide(
                          color: Color(0xFFAFA394),
                        ),
                      ),
                      children: [
                        buildTableRowItem(studioList[index]),
                      ],
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MSButton.gradient(
                    onPressed: () {},
                    width: 200,
                    height: 23,
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF684B3E).withOpacity(0.7),
                        const Color(0xFF684B3E)
                      ],
                    ),
                    child: MSText.bold(
                      '전체 랭킹',
                      color: ColorName.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                AppSize.size6,
                Expanded(
                  child: MSButton.gradient(
                    onPressed: () {},
                    width: 200,
                    height: 23,
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF684B3E).withOpacity(0.7),
                        const Color(0xFF684B3E)
                      ],
                    ),
                    child: MSText.bold(
                      '직업 랭킹',
                      color: ColorName.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 127,
                    width: 124,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 127,
                    width: 124,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 127,
                    width: 124,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // _bottomRecord(),
          ],
        ),
      ),
    );
  }
}
