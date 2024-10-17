import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/components/components.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_success_widget.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

class HomeFragment extends StatefulWidget {
  final HomeSuccess state;

  const HomeFragment({
    super.key,
    required this.state,
  });

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BasicInfo basicInfo = widget.state.basicInfo;
    Stat stat = widget.state.stat;
    HyperStat hyperStat = widget.state.hyperStat;
    Ability ability = widget.state.ability;

    return MSBaseBuildWidget(
      title: basicInfo.characterName,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppInset.all8,
            child: Column(
              children: [
                HomeTop(basicInfo: basicInfo,),
                AppSize.height(8),
                MSTabBar(
                  scrollController: scrollController,
                  tabController: _tabController,
                  tabBarList: [
                    TabBarType(
                      onTap: () {},
                      text: '스텟',
                    ),
                    TabBarType(
                      onTap: () {},
                      text: '장비',
                    ),
                    TabBarType(
                      onTap: () {},
                      text: '스킬',
                    ),
                    TabBarType(
                      onTap: () {},
                      text: '성향 / 어빌리티',
                    ),
                  ],
                ),
                AppSize.height(8),

                TabBarView(
                  controller: _tabController,
                  children: [
                    HomeCenter(stat: stat, hyperStat: hyperStat, ability: ability),
                    Container(color: Colors.redAccent,),
                    Container(color: Colors.orangeAccent,),
                    Container(color: Colors.yellowAccent,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
