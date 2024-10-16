import 'package:flutter/material.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

Widget filterButton() {
  return Row(
    children: [
      Expanded(
        child: MSButton.gradient(
          onPressed: () {},
          width: 200,
          height: 23,
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF684B3E).withOpacity(0.7),
              const Color(0xFF684B3E)
            ],
          ),
          child: MSText.bold(
            '전체 랭킹',
            color: ColorName.white,
            fontSize: 15,
          ),
        ),
      ),
      AppSize.size6,
      Expanded(
        child: MSButton.gradient(
          onPressed: () {},
          width: 200,
          height: 23,
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF684B3E).withOpacity(0.7),
              const Color(0xFF684B3E)
            ],
          ),
          child: MSText.bold(
            '직업 랭킹',
            color: ColorName.white,
            fontSize: 15,
          ),
        ),
      ),
    ],
  );
}