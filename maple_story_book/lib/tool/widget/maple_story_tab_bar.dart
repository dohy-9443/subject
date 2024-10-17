import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

class MSTabBar extends StatefulWidget {
  final ScrollController scrollController;
  final List<TabBarType> tabBarList;
  late TabController tabController;
  final bool isScrollable;

  MSTabBar({
    super.key,
    required this.tabBarList,
    required this.scrollController,
    required this.tabController,
    this.isScrollable = false,
  });

  @override
  State<MSTabBar> createState() => _MSTabBarState();
}

class _MSTabBarState extends State<MSTabBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      if (widget.tabController.indexIsChanging) {
        _scrollToSelectedTab(widget.tabController.index);
      }
    });
  }

  void _scrollToSelectedTab(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabWidth = 100;

    double offset = (index * tabWidth) - (screenWidth - tabWidth) / 2;
    widget.scrollController.animateTo(
      offset.clamp(0.0, widget.scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onChipTap(int index) {
    if (_selectedIndex == index) return;

    setState(() => _selectedIndex = index);

    widget.tabBarList[index].onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      color: ColorName.white,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: TabBar(
          controller: widget.tabController,
          isScrollable: widget.isScrollable,
          tabAlignment: widget.isScrollable ? TabAlignment.start : null,
          indicatorColor: ColorName.beige,
          labelColor: ColorName.beige,
          unselectedLabelColor: ColorName.lightGray2,
          onTap: onChipTap,
          tabs: widget.tabBarList.map((tab) {
            return Tab(text: tab.text,);
          }).toList(),
        ),
      ),
    );
  }
}

class TabBarType {
  final VoidCallback? onTap;
  final String text;

  TabBarType({this.onTap, required this.text});
}

