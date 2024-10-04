import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/component.dart';
import 'package:maple_story_book/tool/theme/colors.dart';

///
/// @Project name    : maple_story_book
/// @Class           : all_screen.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      :
///

class AllScreen extends StatelessWidget {
  const AllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('전체보기'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorName.white,
          padding: AppInset.all10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AllListItem(
                category: '길드',
                subCategory: [
                  AllSubScreenType(title: '정보', path: '/'),
                ],
              ),
              AllListItem(
                category: '알림',
                subCategory: [
                  AllSubScreenType(title: '알림', path: '/'),
                  AllSubScreenType(title: '업데이트', path: '/'),
                  AllSubScreenType(title: '캐시샵', path: '/'),
                  AllSubScreenType(title: '이벤트', path: '/'),
                  AllSubScreenType(title: '알림', path: '/'),
                  AllSubScreenType(title: '업데이트', path: '/'),
                  AllSubScreenType(title: '캐시샵', path: '/'),
                  AllSubScreenType(title: '이벤트', path: '/'),
                  AllSubScreenType(title: '알림', path: '/'),
                  AllSubScreenType(title: '업데이트', path: '/'),
                  AllSubScreenType(title: '캐시샵', path: '/'),
                  AllSubScreenType(title: '이벤트', path: '/'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MSText.bold(category),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorName.mainAccent,
            ),
            child: Column(
              children: List.generate(subCategory.length, (index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () => context.go(subCategory[index].path),
                      title: Text(subCategory[index].title),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      ),
                    ),
                    if (index < subCategory.length - 1)
                      const Divider(color: ColorName.white, height: 1)
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class AllSubScreenType {
  final String title;
  final String path;

  AllSubScreenType({required this.title, required this.path});
}