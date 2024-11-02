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
  final List<ItemEquipmentElement> items;
  final int index;

  const EquipmentBox({super.key, required this.items, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: ColorName.lightGray1,
        borderRadius: items[1].potentialOptionGrade == "" ? BorderRadius.circular(10) : null,
        border: items[1].potentialOptionGrade != "" ? Border.all(
          width: 3,
          color: _equipmentBorder(items[1].potentialOptionGrade),
        ): null,
      ),
      child: Stack(
        children: [
          MSText.bold(
            _equipmentInventoryName(index),
            fontSize: 10,
            color: ColorName.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 40,
                height: 40,
                // child: CachedNetworkImage(
                //   imageUrl: items[1].itemIcon,
                //   fit: BoxFit.contain,
                //   placeholder: (context, url) => CircularProgressIndicator(),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),
                // child: Text(index.toString()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _equipmentBorder(String grade) {
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

  String _equipmentInventoryName(int index) {

    switch (index) {
      case 0:case 5:case 10:case 15:case 20:
        return 'RING';
      case 6:case 11:
        return 'PENDANT';
      case 16:
        return 'WEAPON';
      case 21:
        return 'BELT';
      case 2:
        return 'CAP';
      case 7:
        return 'FORE\nHEAD';
      case 12:
        return 'EYE\nACC';
      case 17:
        return 'CLOTHES';
      case 22:
        return 'PANTS';
      case 27:
        return 'SHOES';
      case 13:
        return 'EAR\nACC';
      case 18:
        return 'SHOULDER';
      case 23:
        return 'GLOVES';
      case 28:
        return 'ANDROID';
      case 4:
        return 'EMBLEM';
      case 9:
        return 'BADGE';
      case 14:
        return 'MEDAL';
      case 19:
        return 'SUB\nWEAPON';
      case 24:
        return 'CAPE';
      case 29:
        return 'HEART';
      default:
        return '';
    }

  }
}
