import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/core/util/insets.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/colors.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_success_widget.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

class HomeSuccessWidget extends StatelessWidget {
  final HomeSuccess state;

  const HomeSuccessWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    BasicInfo basicInfo = state.basicInfo;

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

    return MSBaseBuildWidget(
      title: characterName,
      body: Container(
        // color: ColorName.black.withOpacity(0.6),
        child: SingleChildScrollView(
          child: Padding(
            padding: AppInset.all8,
            child: Column(
              children: [
                Container(
                  height: 200,
                  padding: AppInset.edgeInsetsValue([0, 8]),
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(20)
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
                              Container(
                                width: 100,
                                padding: AppInset.all2,
                                decoration: BoxDecoration(
                                  color: ColorName.lightGray3,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MSText.basic(characterClass, textAlign: TextAlign.center, color: ColorName.white, fontSize: 12,),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 100,
                                padding: AppInset.all2,
                                decoration: BoxDecoration(
                                  color: ColorName.lightGray2,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        AppSize.width(4),
                                        MSText.basic('유니온', color: ColorName.white, fontSize: 12,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MSText.basic('ㅡ', color: ColorName.white, fontSize: 12,),
                                        AppSize.width(4),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              AppSize.height(4),
                              Container(
                                width: 100,
                                padding: AppInset.all2,
                                decoration: BoxDecoration(
                                  color: ColorName.lightGray2,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        AppSize.width(4),
                                        MSText.basic('무릉도장', color: ColorName.white, fontSize: 12,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MSText.basic('ㅡ', color: ColorName.white, fontSize: 12,),
                                        AppSize.width(4),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              AppSize.height(4),
                              Container(
                                width: 100,
                                padding: AppInset.all2,
                                decoration: BoxDecoration(
                                  color: ColorName.lightGray2,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        AppSize.width(4),
                                        MSText.basic('인기도', color: ColorName.white, fontSize: 12,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MSText.basic('ㅡ', color: ColorName.white, fontSize: 12,),
                                        AppSize.width(4),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
                              Container(
                                width: 100,
                                padding: AppInset.all2,
                                decoration: BoxDecoration(
                                  color: ColorName.mainAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MSText.bold(characterName, textAlign: TextAlign.center, color: ColorName.white, fontSize: 12,),
                              ),
                              AppSize.height(8),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 100,
                            padding: AppInset.all2,
                            decoration: BoxDecoration(
                              color: ColorName.mainAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MSText.bold('길드', textAlign: TextAlign.center, color: ColorName.white, fontSize: 12,),
                          ),
                          AppSize.height(4),
                          Container(
                            width: 100,
                            padding: AppInset.all2,
                            decoration: BoxDecoration(
                              color: ColorName.lightGray2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    AppSize.width(4),
                                    MSText.basic('길드', color: ColorName.white, fontSize: 12,),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MSText.basic('ㅡ', color: ColorName.white, fontSize: 12,),
                                    AppSize.width(4),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          AppSize.height(4),
                          Container(
                            width: 100,
                            padding: AppInset.all2,
                            decoration: BoxDecoration(
                              color: ColorName.lightGray2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    AppSize.width(4),
                                    MSText.basic('연합', color: ColorName.white, fontSize: 12,),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MSText.basic('ㅡ', color: ColorName.white, fontSize: 12,),
                                    AppSize.width(4),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          AppSize.height(8),
                        ],
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
