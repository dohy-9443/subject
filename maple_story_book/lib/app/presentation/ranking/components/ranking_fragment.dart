import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_event.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';
import 'package:maple_story_book/app/presentation/ranking/components/components.dart';
import 'package:maple_story_book/app/presentation/ranking/widgets/widgets.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_success_widget.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 10..
/// Description      :
///

class RankingFragment extends StatefulWidget {
  final RankingSuccess state;

  const RankingFragment(this.state, {super.key});

  @override
  State<RankingFragment> createState() => _RankingFragmentState();
}

class _RankingFragmentState extends State<RankingFragment>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  ScrollController scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void onTap(int index, String selectWorldName) {
    context.pop(context);

    context.read<RankingBloc>().add(SelectWorldFilter(
          selectWorldName: selectWorldName,
          tabIndex: _tabController.index,
          selectWorldIndex: index,
        ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(children: [
      MSBaseBuildWidget(
        appBar: MSAppBar(
          title: '랭킹',
          actions: [
            BlocBuilder<RankingBloc, IRankingState>(
                builder: (BuildContext context, IRankingState state) {
              if (state is RankingSuccess && _tabController.index != 5) {
                return TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context:
                          Navigator.of(context, rootNavigator: true).context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      isScrollControlled: true,
                      backgroundColor: Colors.grey.withOpacity(0.6),
                      builder: (BuildContext context) {
                        return worldSelectBottomModalSheet(
                            context, state.selectWorldIndex, onTap);
                      },
                    );
                  },
                  child: MSText(
                    state.selectWorldName == ''
                        ? '전체월드'
                        : state.selectWorldName,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            })
          ],
          bottom: BlocBuilder<RankingBloc, IRankingState>(
            builder: (BuildContext context, IRankingState state) {
              if (state is RankingSuccess) {
                return MSTabBar(
                  isScrollable: true,
                  scrollController: scrollController,
                  tabController: _tabController,
                  tabBarList: [
                    TabBarType(
                      onTap: () {
                        context.read<RankingBloc>().add(
                              GetRankingOverallEvent<RankingOverall>(
                                date: DateTime.now()
                                    .subtract(const Duration(days: 3)),
                                worldName: state.selectWorldName,
                              ),
                            );
                      },
                      text: '종합',
                    ),
                    TabBarType(
                      onTap: () {
                        context.read<RankingBloc>().add(
                              GetRankingEvent<RankingUnion>(
                                date: DateTime.now()
                                    .subtract(const Duration(days: 3)),
                                worldName: state.selectWorldName,
                              ),
                            );
                      },
                      text: '유니온',
                    ),
                    TabBarType(
                      onTap: () {
                        context.read<RankingBloc>().add(
                              GetRankingGuildEvent<RankingGuild>(
                                date: DateTime.now()
                                    .subtract(const Duration(days: 3)),
                                worldName: state.selectWorldName,
                                rankingType: 0,
                                guildName: '',
                                page: 1,
                              ),
                            );
                      },
                      text: '길드',
                    ),
                    TabBarType(
                      onTap: () {
                        context.read<RankingBloc>().add(
                              GetRankingStudioEvent<RankingStudio>(
                                date: DateTime.now()
                                    .subtract(const Duration(days: 3)),
                                difficulty: 0,
                                worldName: state.selectWorldName,
                              ),
                            );
                      },
                      text: '무릉동장',
                    ),
                    TabBarType(
                      onTap: () {
                        context.read<RankingBloc>().add(
                              GetRankingEvent<RankingTheSeed>(
                                date: DateTime.now()
                                    .subtract(const Duration(days: 3)),
                                worldName: state.selectWorldName,
                              ),
                            );
                      },
                      text: '더시드',
                    ),
                    TabBarType(
                      onTap: () {
                        context.read<RankingBloc>().add(
                              GetRankingEvent<RankingAchievement>(
                                date: DateTime.now()
                                    .subtract(const Duration(days: 3)),
                                worldName: state.selectWorldName,
                              ),
                            );
                      },
                      text: '업적',
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            OverallTabView(widget.state.rankingOverall?.ranking),
            unionTabView(widget.state.rankingUnion?.ranking),
            guildTabView(widget.state.rankingGuild?.ranking),
            studioTabView(widget.state.rankingStudio?.ranking),
            theSeedTabView(widget.state.rankingTheSeed?.ranking),
            achievementTabView(widget.state.rankingAchievement?.ranking),
          ],
        ),
      ),
    ]);
  }
}
