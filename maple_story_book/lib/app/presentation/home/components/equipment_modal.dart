import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
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
      color: ColorName.white,
    );
  }
}
