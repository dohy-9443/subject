import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/all/components/components.dart';
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

