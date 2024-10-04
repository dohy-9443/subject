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
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50 + kToolbarHeight,
          color: ColorName.modal,
        ),
        Expanded(
          child: SingleChildScrollView(
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
                  category: '공지',
                  subCategory: [
                    AllSubScreenType(title: '알림', path: '/'),
                    AllSubScreenType(title: '업데이트', path: '/'),
                    AllSubScreenType(title: '캐시샵', path: '/'),
                    AllSubScreenType(title: '이벤트', path: '/'),
                  ],
                ),
                AllListItem(
                  category: '히스토리',
                  subCategory: [
                    AllSubScreenType(title: '큐브', path: '/'),
                    AllSubScreenType(title: '잠재능력', path: '/'),
                    AllSubScreenType(title: '스타포스', path: '/'),
                  ],
                ),
                AllListItem(
                  category: '약관 및 정책',
                  subCategory: [
                    AllSubScreenType(title: '약관 및 이용동의', path: '/'),
                  ],
                ),
                AllListItem(
                  category: '앱 정보',
                  subCategory: [
                    AllSubScreenType(title: '버전 정보 (1.0.0)', path: '/'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
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

class AllSubScreenType {
  final String title;
  final String path;

  AllSubScreenType({required this.title, required this.path});
}
