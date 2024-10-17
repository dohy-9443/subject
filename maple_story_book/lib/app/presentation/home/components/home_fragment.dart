import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/components/components.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
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
  ScrollController tabScrollController = ScrollController();
  bool isExpanded = true;
  bool isTitleVisible = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    scrollController.removeListener(scrollListener);
    tabScrollController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  scrollListener() {
    double threshold = 150;
    double offset = scrollController.offset;
    bool isCurrentlyExpanded = scrollController.offset < 200 - kToolbarHeight;

    if (isExpanded != isCurrentlyExpanded) {
      setState(() {
        isExpanded = isCurrentlyExpanded;
      });
    }

    if (offset > threshold) {
      setState(() {
        isTitleVisible = true;
      });
    // } else if (offset <= threshold && isTitleVisible) {
    //   print("여기도 아닌거같은데?");
    //   setState(() {
    //     isTitleVisible = false;
    //   });
    } else {
      setState(() {
        isTitleVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BasicInfo basicInfo = widget.state.basicInfo;
    Stat stat = widget.state.stat;
    HyperStat hyperStat = widget.state.hyperStat;
    Ability ability = widget.state.ability;

    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          backgroundColor: isExpanded ? ColorName.lightBg : ColorName.mainAccent,
          floating: true,
          title: isTitleVisible && !isExpanded ?
            MSText.bold(basicInfo.characterName, color: ColorName.white, fontSize: 20,)
              : null,
          flexibleSpace: FlexibleSpaceBar(
            background: SafeArea(
              child: Padding(
                padding: AppInset.h8,
                child: HomeTop(basicInfo: basicInfo,),
              ),
            ),
          )
        ),
        SliverToBoxAdapter(child: AppSize.height(8),),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverTabBarDelegate(MSTabBar(
            scrollController: tabScrollController,
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
          )),
        ),
        SliverToBoxAdapter(child: AppSize.height(8),),
        SliverToBoxAdapter(
          child: Padding(
            padding: AppInset.all8,
            child: HomeCenter(stat: stat, hyperStat: hyperStat, ability: ability),
          ),
        ),
      ],
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final MSTabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // MSTabBar의 배경 색상
      child: PreferredSize(
        preferredSize: Size.fromHeight(48), // MSTabBar의 높이를 설정
        child: tabBar,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return oldDelegate.tabBar != tabBar;
  }
}

// SingleChildScrollView(
//   child: TabBarView(
//     controller: _tabController,
//     children: [
//       HomeCenter(stat: stat, hyperStat: hyperStat, ability: ability),
//       Container(color: Colors.redAccent,),
//       Container(color: Colors.orangeAccent,),
//       Container(color: Colors.yellowAccent,),
//     ],
//   ),
// ),