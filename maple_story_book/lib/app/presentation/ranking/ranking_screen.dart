import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_event.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/base_state_handler.dart';
import 'package:maple_story_book/tool/component/component.dart';
import 'package:maple_story_book/tool/component/maple_story_full_screen.dart';
import 'package:maple_story_book/tool/theme/colors.dart';
import 'package:maple_story_book/tool/widget/maple_story_text.dart';
import 'package:maple_story_book/tool/widget/maple_stroy_button.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_screen.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      :
///

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  void initState() {
    context.read<RankingBloc>().add(GetRankingEvent<RankingTheSeed>(
        date: DateTime.now().subtract(const Duration(days: 3))));
    context.read<RankingBloc>().add(GetRankingEvent<RankingUnion>(
        date: DateTime.now().subtract(const Duration(days: 3))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    successWidget() {
      List<RankingOverallElement> rankingList = const [
        RankingOverallElement(
          date: '2023-12-22',
          worldName: "버닝3",
          ranking: 1,
          characterName: "나득빕",
          characterLevel: 236,
          characterExp: 14664194469,
          className: "기사단",
          subClassName: "나이트워커",
          characterPopularity: 0,
          characterGuildName: "드림",
        ),
        RankingOverallElement(
          date: "2023-12-22",
          worldName: "버닝3",
          ranking: 2,
          characterName: "뀨잉트워커",
          characterLevel: 233,
          characterExp: 59246911819,
          className: "기사단",
          subClassName: "나이트워커",
          characterPopularity: 0,
          characterGuildName: "바다",
        ),
        RankingOverallElement(
          date: '2023-12-22',
          worldName: "버닝3",
          ranking: 1,
          characterName: "나득빕",
          characterLevel: 236,
          characterExp: 14664194469,
          className: "기사단",
          subClassName: "나이트워커",
          characterPopularity: 0,
          characterGuildName: "드림",
        ),
        RankingOverallElement(
          date: "2023-12-22",
          worldName: "버닝3",
          ranking: 2,
          characterName: "뀨잉트워커",
          characterLevel: 233,
          characterExp: 59246911819,
          className: "기사단",
          subClassName: "나이트워커",
          characterPopularity: 0,
          characterGuildName: "바다",
        ),
        RankingOverallElement(
          date: '2023-12-22',
          worldName: "버닝3",
          ranking: 1,
          characterName: "나득빕",
          characterLevel: 236,
          characterExp: 14664194469,
          className: "기사단",
          subClassName: "나이트워커",
          characterPopularity: 0,
          characterGuildName: "드림",
        ),
        RankingOverallElement(
          date: "2023-12-22",
          worldName: "버닝3",
          ranking: 2,
          characterName: "뀨잉트워커",
          characterLevel: 233,
          characterExp: 59246911819,
          className: "기사단",
          subClassName: "나이트워커",
          characterPopularity: 0,
          characterGuildName: "바다",
        ),
      ];

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
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 50 + kToolbarHeight,
            color: ColorName.modal,
          ),
          Expanded(
            child: Padding(
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
                              buildTableRow2(studioList[index]),
                              // buildTableRow(rankingList[index]),
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
                          height: 100,
                          width: 130,
                          decoration: BoxDecoration(
                            color: ColorName.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 130,
                          decoration: BoxDecoration(
                            color: ColorName.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 130,
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
          ),
        ],
      );
    }

    return BlocBuilder<RankingBloc, IRankingState>(
        builder: (BuildContext context, IRankingState state) {
      return BlocHandler<IRankingState>(
        state: state,
        initial: () => const MSLoading(),
        success: (context, successState) => MSErrorFullScreen(
          // error: error,
          onPressed: () {},
        ),
        error: (context, error) => MSErrorFullScreen(
          error: error,
          onPressed: () {},
        ),
      );
    });

    // return BlocBuilder<RankingBloc, IRankingState>(
    //     builder: (BuildContext context, IRankingState state) {
    //   if (state is RankingError) {
    //     return MSErrorFullScreen();
    //   } else if (state is RankingInitial) {
    //     return Text('dd');
    //   } else {
    //     return successWidget();
    //   }
    // });

    // return BlocConsumer<RankingBloc, IRankingState>(
    //     listener: (BuildContext context, IRankingState state) {
    //       if(state is RankingError){
    //         mSErrorDialog(context, onBtnClicked: () {  }, error: '', description: state.error);
    //       }
    //     },
    //     builder: (BuildContext context, IRankingState state) {
    //   if (state is RankingError) {
    //     return mSErrorFullScreen(context, state.error,state.error,() {});
    //   } else if (state is RankingInitial) {
    //     return Text('dd');
    //   } else {
    //     return successWidget();
    //   }
    // }, );
  }

  // 종합 랭킹
  TableRow buildTableRow(RankingOverallElement rank) {
    return TableRow(
      children: [
        TableCell(
            child: Text(
          rank.date,
          style: const TextStyle(
              color: Color(0xFF684B3E), fontWeight: FontWeight.bold),
        )),
        TableCell(child: Text(rank.worldName)),
        TableCell(child: Text(rank.characterName)),
        TableCell(child: Text(rank.characterGuildName)),
        TableCell(child: Text(rank.className)),
        TableCell(child: Text(rank.subClassName)),
      ],
    );
  }

  // 무릉도장
  TableRow buildTableRow2(RankingStudioElement rank) {
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
}
