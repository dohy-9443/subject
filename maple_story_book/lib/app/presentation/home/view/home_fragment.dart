import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/components/components.dart';
import 'package:maple_story_book/app/presentation/home/view/view.dart';
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
    _tabController.addListener(_scrollToSelectedTab);
  }

  void _scrollToSelectedTab() {
    if (mounted) {
      // Example: 특정 탭으로 스크롤 이동 처리
    }
  }

  @override
  void dispose() {
    // 리스너 제거
    _tabController.removeListener(_scrollToSelectedTab);

    if (mounted) {
      _tabController.dispose();
      scrollController.removeListener(scrollListener);
      tabScrollController.dispose();
      scrollController.dispose();
    }
    super.dispose();
  }

  scrollListener() {
    double threshold = 200;
    double offset = scrollController.offset;
    bool isCurrentlyExpanded = scrollController.offset < 100 - kToolbarHeight;

    if (isExpanded != isCurrentlyExpanded) {
      setState(() {
        isExpanded = isCurrentlyExpanded;
      });
    }

    if (offset > threshold) {
      setState(() {
        isTitleVisible = true;
      });
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
    ItemEquipment itemEquipment = widget.state.itemEquipment;

    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            floating: true,
            backgroundColor: isTitleVisible && !isExpanded ? ColorName.mainAccent : ColorName.lightBg,
            title: isTitleVisible && !isExpanded
                ? MSText.bold(basicInfo.characterName, color: ColorName.white, fontSize: 20)
                : null,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Padding(
                  padding: AppInset.h8,
                  child: HomeTop(basicInfo: basicInfo),
                ),
              ),
            ),
            leading: isTitleVisible && !isExpanded
                ? IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: ColorName.white),
            )
                : null,
            actions: isTitleVisible && !isExpanded
                ? [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: ColorName.white),
              ),
            ] : null,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverTabBarDelegate(
              MSTabBar(
                scrollController: tabScrollController,
                tabController: _tabController,
                tabBarList: [
                  TabBarType(onTap: () {}, text: '스텟'),
                  TabBarType(onTap: () {
                    context.read<HomeBloc>().add(GetHomeEvent<ItemEquipment>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
                    context.read<HomeBloc>().add(GetHomeEvent<SetEffect>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
                    context.read<HomeBloc>().add(GetHomeEvent<SymbolEquipment>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
                  }, text: '장비'),
                  TabBarType(onTap: () {}, text: '스킬'),
                  TabBarType(onTap: () {}, text: '성향 / 어빌리티'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: AppSize.height(8)),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          // 첫 번째 탭의 내용 (예: 스탯 관련 콘텐츠)
          SingleChildScrollView(
            padding: AppInset.all8,
            child: HomeStat(stat: stat, hyperStat: hyperStat, ability: ability),
          ),
          // 두 번째 탭의 내용
          SingleChildScrollView(
            padding: AppInset.all8,
            child: HomeEquipment(itemEquipment: itemEquipment),
          ),
          // 세 번째 탭의 내용
          const SingleChildScrollView(
            padding: AppInset.all8,
            child: HomeSkill(),
          ),
          // 네 번째 탭의 내용
          const SingleChildScrollView(
            padding: AppInset.all8,
            child: HomePropensityAbility(),
          ),
        ],
      ),
    );
  }
}