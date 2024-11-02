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

class EquipmentName {
  final String en;
  final String ko;

  EquipmentName({required this.en, required this.ko});
}

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
            _equipmentInventoryName(index).en,
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
                child: CachedNetworkImage(
                  imageUrl: items.firstWhere((e) {
                    return (e.itemEquipmentSlot == _equipmentInventoryName(index).ko);
                  }).itemIcon,
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

  EquipmentName _equipmentInventoryName(int index) {

    switch (index) {
      case 0:
        return EquipmentName(en: 'RING', ko: '반지1');
      case 5:
        return EquipmentName(en: 'RING', ko: '반지2');
      case 10:
        return EquipmentName(en: 'RING', ko: '반지3');
      case 15:
        return EquipmentName(en: 'RING', ko: '반지4');
      case 20:
        return EquipmentName(en: 'POKET', ko: '포켓 아이템');
      case 6:
        return EquipmentName(en: 'PENDANT', ko: '펜던트');
      case 11:
        return EquipmentName(en: 'PENDANT', ko: '펜던트2');
      case 16:
        return EquipmentName(en: 'WEAPON', ko: '무기');
      case 21:
        return EquipmentName(en: 'BELT', ko: '벨트');
      case 2:
        return EquipmentName(en: 'CAP', ko: '모자');
      case 7:
        return EquipmentName(en: 'FORE\nHEAD', ko: '얼굴장식');
      case 12:
        return EquipmentName(en: 'EYE\nACC', ko: '눈장식');
      case 17:
        return EquipmentName(en: 'CLOTHES', ko: '상의');
      case 22:
        return EquipmentName(en: 'PANTS', ko: '하의');
      case 27:
        return EquipmentName(en: 'SHOES', ko: '신발');
      case 13:
        return EquipmentName(en: 'EAR\nACC', ko: '귀고리');
      case 18:
        return EquipmentName(en: 'SHOULDER', ko: '어깨장식');
      case 23:
        return EquipmentName(en: 'GLOVES', ko: '장갑');
      case 28:
        return EquipmentName(en: 'ANDROID', ko: '안드로이드');
      case 4:
        return EquipmentName(en: 'EMBLEM', ko: '엠블렘');
      case 9:
        return EquipmentName(en: 'BADGE', ko: '뱃지');
      case 14:
        return EquipmentName(en: 'MEDAL', ko: '훈장');
      case 19:
        return EquipmentName(en: 'SUB\nWEAPON', ko: '보조무기');
      case 24:
        return EquipmentName(en: 'CAPE', ko: '망토');
      case 29:
        return EquipmentName(en: 'HEART', ko: '기계 심장');
      default:
        return EquipmentName(en: '', ko: '');
    }

  }
}
