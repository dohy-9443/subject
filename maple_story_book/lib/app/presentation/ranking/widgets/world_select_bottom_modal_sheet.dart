import 'package:flutter/material.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

Widget worldSelectBottomModalSheet(BuildContext context, int selectWorldIndex,
    void Function(int, String) onTap) {
  return Container(
    padding: AppInset.edgeInsetsValue([8]),
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.white, width: 2)),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            width: 100,
            padding: AppInset.all2,
            child: Center(
              child: MSText.bold(
                '월드 선택',
                color: ColorName.white,
              ),
            ),
          ),
          worldSelectButton(selectWorldIndex, onTap),
        ],
      ),
    ),
  );
}

Widget worldSelectButton(
    int selectWorldIndex, void Function(int, String) onTap) {
  List<WorldSelectModel> worldsPath = [
    WorldSelectModel(
      worldImage: Assets.images.mapleWholeWorld.path,
      worldKorName: '전체월드',
      worldEngName: 'ALLWORLD',
    ),
    WorldSelectModel(
        worldImage: Assets.images.skaniaWorld.path,
        worldKorName: '스카니아',
        worldEngName: 'SCANIA'),
    WorldSelectModel(
        worldImage: Assets.images.beraWorld.path,
        worldKorName: '베라',
        worldEngName: 'BERA'),
    WorldSelectModel(
        worldImage: Assets.images.lunaWorld.path,
        worldKorName: '루나',
        worldEngName: 'LUNA'),
    WorldSelectModel(
        worldImage: Assets.images.zenithWorld.path,
        worldKorName: '제니스',
        worldEngName: 'ZENITH'),
    WorldSelectModel(
        worldImage: Assets.images.croaWorld.path,
        worldKorName: '크로아',
        worldEngName: 'CROA'),
    WorldSelectModel(
        worldImage: Assets.images.unionWorld.path,
        worldKorName: '유니온',
        worldEngName: 'UNION'),
    WorldSelectModel(
        worldImage: Assets.images.elysiumWorld.path,
        worldKorName: '엘리시움',
        worldEngName: 'ELYSIUM'),
    WorldSelectModel(
        worldImage: Assets.images.enosisWorld.path,
        worldKorName: '이노시스',
        worldEngName: 'ENOSIS'),
    WorldSelectModel(
        worldImage: Assets.images.redWorld.path,
        worldKorName: '레드',
        worldEngName: 'RED'),
    WorldSelectModel(
        worldImage: Assets.images.auroraWorld.path,
        worldKorName: '오로라',
        worldEngName: 'AURORA'),
    WorldSelectModel(
        worldImage: Assets.images.arcaneWorld.path,
        worldKorName: '아케인',
        worldEngName: 'ARCANE'),
    WorldSelectModel(
        worldImage: Assets.images.novaWorld.path,
        worldKorName: '노바',
        worldEngName: 'NOVA'),
    WorldSelectModel(
        worldImage: Assets.images.rebootWorld.path,
        worldKorName: '리부트',
        worldEngName: 'REBOOT'),
    WorldSelectModel(
        worldImage: Assets.images.rebootWorld.path,
        worldKorName: '리부트 2',
        worldEngName: 'REBOOT2'),
    WorldSelectModel(
        worldImage: Assets.images.bunningWorld.path,
        worldKorName: '버닝1',
        worldEngName: 'BUNNING1'),
    WorldSelectModel(
        worldImage: Assets.images.bunningWorld.path,
        worldKorName: '버닝2',
        worldEngName: 'BUNNING2'),
    WorldSelectModel(
      worldImage: Assets.images.bunningWorld.path,
      worldKorName: '버닝3',
      worldEngName: 'BUNNING3',
    ),
  ];

  return Container(
    decoration: BoxDecoration(
      color: const Color(0XFFA9A9A4),
      borderRadius: BorderRadius.circular(10),
    ),
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: worldsPath.length,
      itemBuilder: (BuildContext context, int index) {
        return worldButton(worldsPath[index], index, selectWorldIndex, onTap);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    ),
  );
}

Widget worldButton(WorldSelectModel worldSelect, int index,
    int selectedWorldIndex, void Function(int, String) onTap) {
  return GestureDetector(
    onTap: () => onTap(index, worldSelect.worldKorName),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.white),
        borderRadius: BorderRadius.circular(10),
        gradient: index == selectedWorldIndex
            ? null
            : const LinearGradient(
                colors: [Color(0xFFC3B6A0), ColorName.beige],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
        boxShadow: [
          if (index == selectedWorldIndex)
            const BoxShadow(
              color: ColorName.mainAccent,
              spreadRadius: 1,
              blurRadius: 1,
            ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            worldSelect.worldImage,
            width: 35,
            height: 35,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MSText.bold(
                worldSelect.worldKorName,
                fontSize: 14,
                color: ColorName.white,
              ),
              MSText.bold(
                worldSelect.worldEngName,
                fontSize: 7,
                color: Colors.brown,
              )
            ],
          )
        ],
      ),
    ),
  );
}

class WorldSelectModel {
  final String worldImage;
  final String worldKorName;
  final String worldEngName;

  WorldSelectModel({
    required this.worldImage,
    required this.worldKorName,
    required this.worldEngName,
  });
}
