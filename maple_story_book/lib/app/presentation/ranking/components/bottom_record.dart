import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

Widget bottomRecord() {
  return SizedBox(
    height: 150,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 127,
          width: 124,
          decoration: BoxDecoration(
            color: ColorName.white,
            border: Border.all(
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 127,
          width: 124,
          decoration: BoxDecoration(
            color: ColorName.white,
            border: Border.all(
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 127,
          width: 124,
          decoration: BoxDecoration(
            color: ColorName.white,
            border: Border.all(
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}