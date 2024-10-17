import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/ranking/widgets/widgets.dart';
import 'package:maple_story_book/core/enum/enum.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

Widget topRankerItemTemplate<T>({
  required T rank,
  required int index,
  required String characterName,
  required String centerInfo,
  required String worldName,
  required int ranking,
  required List<Widget> bottomInfo,
  bool isGuild = false,
}) {
  WorldImage worldImagePath = WorldImage.getWorldImage(worldName);

  return Padding(
    padding: AppInset.edgeInsetsValue([10, 5]),
    child: Column(
      children: [
        if (index < 3)
          Container(
            height: 30,
            decoration: rankingDecoration(ranking),
            width: double.infinity,
            child: Center(child: MSText('$ranking위', fontSize: 14)),
          ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFDFDDC7).withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xFFDFDDC7)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  if (!isGuild) ...[
                    if (index < 3) ...[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(child: MSText('캐릭터')),
                      ),
                      AppSize.width(10),
                      Row(
                        children: [
                          Image.asset(
                            worldImagePath.name,
                            width: 25,
                            height: 25,
                          ),
                          AppSize.size2,
                          MSText(characterName, fontSize: 14),
                        ],
                      ),
                      MSText(centerInfo, fontSize: 14),
                      ...bottomInfo,
                    ],
                  ],
                  if (isGuild) ...[
                    Row(
                      children: [
                        Image.asset(worldImagePath.name, width: 25, height: 25),
                        const SizedBox(width: 8),
                      ],
                    ),
                    ...bottomInfo,
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
