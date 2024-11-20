import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/core/extension/build_context_extension.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : equipment_modal.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 11. 15..
/// Description      : 
///

class EquipmentModal extends StatelessWidget {
  final ItemEquipmentElement item;

  const EquipmentModal({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    print("item.starforce : ${item.starforce}");

    final starSize = (context.screenWidth - 14 * 5) / 15;
    const int starsPerRow = 15; // 한 줄에 배치할 별 개수
    const double spacing = 5.0; // 별 사이 간격

    return Container(
      width: context.screenWidth * .8,
      height: context.screenHeight * .8,
      decoration: BoxDecoration(
        color: ColorName.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorName.white,
          width: 2,
        ),
      ),
      child: Padding(
        padding: AppInset.all8,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Wrap(
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: List.generate(25, (index) {
                  return SizedBox(
                    width: (index + 1) % 5 == 0 ? starSize : starSize * 0.8,
                    height: starSize * 0.8,
                    child: Icon(
                      Icons.star,
                      color: index < item.starforce ? Colors.yellowAccent : Colors.grey,
                      size: starSize * 0.8,
                    ),
                  );
                }),
              )
            )
          ],
        ),
      ),
    );
  }
}
