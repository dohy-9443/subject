import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/component.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : all_list_item.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 5..
/// Description      : 
///

class AllSubScreenType {
  final String title;
  final String path;

  AllSubScreenType({required this.title, required this.path});
}

class AllListItem extends StatelessWidget {
  final String category;
  final List<AllSubScreenType> subCategory;

  const AllListItem({
    super.key,
    required this.category,
    required this.subCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color(0xFFE5E5E5),
          child: ListTile(
            minTileHeight: 15,
            title: MSText.basic(
              category,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: List.generate(subCategory.length, (index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () => context.go(subCategory[index].path),
                    title: MSText.basic(
                      subCategory[index].title,
                      fontSize: 18,
                      color: ColorName.black,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                  ),
                  if (index < subCategory.length - 1)
                    Padding(
                      padding: AppInset.h10,
                      child: Divider(
                          color: ColorName.lightGray1.withOpacity(0.3),
                          height: 1),
                    )
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}