import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_event.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';
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
  final RankingSuccess state;

  const RankingSuccessWidget(this.state, {super.key});

  @override
  State<RankingSuccessWidget> createState() => _RankingSuccessWidgetState();
}

class _RankingSuccessWidgetState extends State<RankingSuccessWidget>
    with SingleTickerProviderStateMixin {
  final String selectWorld = '';

  late TabController _tabController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

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
            onPressed: () {
              // TODO : 월드 네임 정하는 것
            },
            icon: const Icon(
              Icons.settings,
              size: 20,
            ),
          ),
        ],
        bottom: MSTabBar(
          isScrollable: true,
          scrollController: scrollController,
          tabController: _tabController,
          tabBarList: [
            TabBarType(
              onTap: () {
                context.read<RankingBloc>().add(
                    GetRankingOverallEvent<RankingOverall>(
                        date:
                        DateTime.now().subtract(const Duration(days: 3))));
              },
              text: '종합',
            ),
            TabBarType(
                onTap: () {
                  context.read<RankingBloc>().add(GetRankingEvent<RankingUnion>(
                      date: DateTime.now().subtract(const Duration(days: 3))));
                },
                text: '유니온'),
            TabBarType(
                onTap: () {
                  context.read<RankingBloc>().add(
                      GetRankingGuildEvent<RankingGuild>(
                          date: DateTime.now().subtract(const Duration(days: 3)),
                          worldName: '',
                          rankingType: 0,
                          guildName: '',
                          page: 0));
                },
                text: '길드'),
            TabBarType(
                onTap: () {
                  context.read<RankingBloc>().add(
                      GetRankingStudioEvent<RankingStudio>(
                          date:
                          DateTime.now().subtract(const Duration(days: 3)),
                          difficulty: 0));
                },
                text: '무릉도장'),
            TabBarType(
                onTap: () {
                  context.read<RankingBloc>().add(
                      GetRankingEvent<RankingTheSeed>(
                          date: DateTime.now()
                              .subtract(const Duration(days: 3))));
                },
                text: '더시드'),
            TabBarType(
                onTap: () {
                  context.read<RankingBloc>().add(
                      GetRankingEvent<RankingAchievement>(
                          date: DateTime.now()
                              .subtract(const Duration(days: 3))));
                },
                text: '업적'),
            TabBarType(
                onTap: () {
                  context.read<RankingBloc>().add(
                      GetRankingEvent<RankingAchievement>(
                          date: DateTime.now()
                              .subtract(const Duration(days: 3))));
                },
                text: '업적2'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // widget.tapBarList.map((tab) => tab.content).toList(),
          Container(
            color: Colors.red,
            child: Text('1'),
          ),
          Container(
            color: Colors.red,
            child: Text('2'),
          ),
          Container(
            color: Colors.red,
            child: Text('3'),
          ),
          Container(
            color: Colors.red,
            child: Text('4'),
          ),
          Container(
            color: Colors.red,
            child: Text('5'),
          ),
          Container(
            color: Colors.red,
            child: Text('6'),
          ),
          Container(
            color: Colors.red,
            child: Text('7'),
          ),
        ],
      ),
    );
  }
}

Widget _commonTap() {
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
  return Padding(
    padding: AppInset.all8,
    child: Column(
      children: [
        _topRanker(),
        _rankerList(studioList),
        _filterButton(),
        _bottomRecord(),
      ],
    ),
  );
}

Widget _topRanker() {
  return SizedBox(
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
  );
}

Widget _rankerList(List list) => Expanded(
  child: Container(
    color: const Color(0xFFDFDDC7),
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Table(
          border: const TableBorder(
            horizontalInside: BorderSide(
              color: Color(0xFFAFA394),
            ),
          ),
          children: [
            buildTableRowItem(list[index]),
          ],
        );
      },
    ),
  ),
);

Widget _filterButton() {
  return Row(
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
  );
}

Widget _bottomRecord() {
  return SizedBox(
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
  );
}
