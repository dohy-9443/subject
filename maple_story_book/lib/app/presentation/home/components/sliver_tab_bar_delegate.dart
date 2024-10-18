import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : sliver_tab_bar_delegate.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 18..
/// Description      : 
///

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final MSTabBar tabBar;

  SliverTabBarDelegate(this.tabBar);

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
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return oldDelegate.tabBar != tabBar;
  }
}