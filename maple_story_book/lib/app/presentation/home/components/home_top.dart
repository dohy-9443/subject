import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/components/components.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_top.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 14..
/// Description      : 
///

class HomeTop extends StatelessWidget {
  final BasicInfo basicInfo;

  const HomeTop({super.key, required this.basicInfo});

  @override
  Widget build(BuildContext context) {
    final (
      date,
      characterName,
      worldName,
      characterGender,
      characterClass,
      characterClassLevel,
      characterLevel,
      characterExp,
      characterExpRate,
      characterGuildName,
      characterImage,
      characterDateCreate,
      accessFlag,
      liberationQuestClearFlag,
    ) = BasicInfo.getCharacterInfo(basicInfo);

    return Container(
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.arcana.path,),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20)
        ),
        margin: AppInset.bottom8,
        child: Container(
          height: 200,
          padding: AppInset.edgeInsetsValue([0, 8]),
          decoration: BoxDecoration(
            color: ColorName.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AppSize.height(8),
                      BorderRadiusContainer(
                        [characterClass],
                        backgroundColor: ColorName.lightGray3,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const BorderRadiusContainer(['유니온', 'ㅡ'],),
                      AppSize.height(4),
                      const BorderRadiusContainer(['무릉도장', 'ㅡ'],),
                      AppSize.height(4),
                      const BorderRadiusContainer(['인기도', 'ㅡ'],),
                      AppSize.height(8),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    padding: AppInset.edgeInsetsValue([2, 0]),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: ColorName.lightGray3,
                      borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero, bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MSText.basic('Lv.', color: ColorName.lightGray1, fontSize: 12,),
                        MSText.basic(characterLevel.toString(), color: ColorName.white, fontSize: 12,)
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: characterImage,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      AppSize.height(4),
                      BorderRadiusContainer(
                        [characterName],
                        backgroundColor: ColorName.mainAccent,
                        bold: true,
                      ),
                      AppSize.height(8),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const BorderRadiusContainer(
                    ['길드'],
                    backgroundColor: ColorName.mainAccent,
                    bold: true,
                  ),
                  AppSize.height(4),
                  const BorderRadiusContainer(['길드', 'ㅡ'],),
                  AppSize.height(4),
                  const BorderRadiusContainer(['연합', 'ㅡ'],),
                  AppSize.height(8),
                ],
              )
            ],
          ),
        )
    );
  }
}
