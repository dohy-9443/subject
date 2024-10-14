import 'package:flutter/material.dart';
import 'package:maple_story_book/core/extension/null_check_extension.dart';
import 'package:maple_story_book/core/util/insets.dart';
import 'package:maple_story_book/tool/theme/colors.dart';

class MSTabBar extends StatefulWidget {
  final ScrollController scrollController;
  final List<TapBarType> tapBarList;

  const MSTabBar({
    super.key,
    required this.scrollController,
    required this.tapBarList,
  });

  @override
  State<MSTabBar> createState() => _MSTabBarState();
}

class _MSTabBarState extends State<MSTabBar> {
  late int _selectedIndex = 0;

  void onChipTap(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    widget.tapBarList[index].onTap.hasData ? widget.tapBarList[index].onTap!() : null;

    if (widget.tapBarList.length > 6) {
      widget.scrollController.animateTo(
        index * 70,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      color: ColorName.white,
      child: ListView.builder(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.tapBarList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onChipTap(index),
            child: Padding(
              padding: AppInset.h4,
              child: Chip(
                label: Text(widget.tapBarList[index].text),
                backgroundColor:
                    _selectedIndex == index ? ColorName.beige : null,
              ),
            ),
          );
        },
      ),
    );
  }
}

class TapBarType {
  final VoidCallback? onTap;
  final String text;

  TapBarType({this.onTap, required this.text});
}
