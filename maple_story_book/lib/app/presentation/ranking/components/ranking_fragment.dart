import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_bloc.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_event.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';
import 'package:maple_story_book/app/presentation/ranking/components/components.dart';
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
  final String selectWorld = '';

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

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              text: '유니온',
            ),
            TabBarType(
              onTap: () {
                context.read<RankingBloc>().add(
                      GetRankingGuildEvent<RankingGuild>(
                        date: DateTime.now().subtract(const Duration(days: 3)),
                        worldName: '',
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
                        date: DateTime.now().subtract(const Duration(days: 3)),
                        difficulty: 0));
              },
              text: '무릉동장',
            ),
            TabBarType(
              onTap: () {
                context.read<RankingBloc>().add(GetRankingEvent<RankingTheSeed>(
                    date: DateTime.now().subtract(const Duration(days: 3))));
              },
              text: '더시드',
            ),
            TabBarType(
              onTap: () {
                context.read<RankingBloc>().add(
                    GetRankingEvent<RankingAchievement>(
                        date:
                            DateTime.now().subtract(const Duration(days: 3))));
              },
              text: '업적',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          overallTabView(widget.state.rankingOverall?.ranking),
          unionTabView(widget.state.rankingUnion?.ranking),
          guildTabView(widget.state.rankingGuild?.ranking),
          studioTabView(widget.state.rankingStudio?.ranking),
          theSeedTabView(widget.state.rankingTheSeed?.ranking),
          achievementTabView(widget.state.rankingAchievement?.ranking),
        ],
      ),
    );
  }
}



