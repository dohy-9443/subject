import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : equipment_box.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 21..
/// Description      : 
///

enum EquipmentOption{
  normal, rare, epic, unique, legendary;
}

class EquipmentBox extends StatelessWidget {
  final ItemEquipmentElement item;
  final bool empty;

  const EquipmentBox({super.key, required this.item, this.empty = false});

  @override
  Widget build(BuildContext context) {
    return empty ? Container(
      width: 70, height: 70, color: Colors.transparent,
    ) :
    Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: ColorName.lightGray1,
        borderRadius: item.potentialOptionGrade == "" ? BorderRadius.circular(10) : null,
        border: item.potentialOptionGrade != "" ? Border.all(
          width: 1,
          color: equipmentBorder(item.potentialOptionGrade),
        ): null
      ),
      child: Stack(
        children: [
          MSText.basic('RING'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 40,
                height: 40,
                child: CachedNetworkImage(
                  imageUrl: item.itemIcon,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color equipmentBorder(String grade) {
    switch (grade) {
      case '레어':
        return ColorName.rareColor;
      case '에픽':
        return ColorName.epicColor;
      case '유니크':
        return ColorName.uniqueColor;
      case '레전드리':
        return ColorName.legendaryColor;
      default:
        return Colors.transparent;
    }
  }
}
