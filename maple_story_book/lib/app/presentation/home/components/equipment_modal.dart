import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/core/extension/build_context_extension.dart';
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
    return Container(
      width: context.screenWidth * .8,
      height: context.screenHeight * .8,
      decoration: BoxDecoration(
        color: ColorName.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorName.white,
          width: 2,
        )
      ),
    );
  }
}
