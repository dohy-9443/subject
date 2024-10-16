import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/ranking/widgets/widgets.dart';

Widget rankerList<T>(List<T> list) => Expanded(
  child: Container(
    color: const Color(0xFFDFDDC7),
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Table(
          border: const TableBorder(
            horizontalInside: BorderSide(
              color: Color(0xFFAFA394),
            ),
          ),
          children: [
              buildTableRowItem<T>(list[index]),
          ],
        );
      },
    ),
  ),
);