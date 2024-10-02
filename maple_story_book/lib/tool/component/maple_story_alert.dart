import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_story_book/core/util/insets.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/component.dart';
import 'package:maple_story_book/tool/theme/colors.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_alert.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 2..
/// Description      : 
///

class MSAlert extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;

  const MSAlert({super.key, required this.title, required this.content, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppInset.all4,
      constraints: const BoxConstraints(
        maxWidth: double.infinity * 0.9,
        maxHeight: 250,
      ),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: ColorName.modal.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 4,
          color: ColorName.lightGray2,
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 200,
                height: 192,
                padding: AppInset.all8,
                margin: AppInset.edgeInsetsValue([3]),
                decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MSText.autoSize(title, fontWeight: FontWeight.bold, maxLines: 2, minFontSize: 14,),
                    AppSize.height(10),
                    MSText.autoSize(content, maxLines: 3,),
                    AppSize.shrink(),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      Assets.images.pinkAlert.path,
                      width: 150,
                    ),
                    AppSize.height(10),
                    Container(
                      padding: AppInset.all2,
                      margin: AppInset.right4,
                      width: 85,
                      height: 20,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF8C8C8C),
                            Color(0xFF666666),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorName.white, width: 1),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: MSText.basic('핑크빈', fontSize: 11, color: ColorName.white, textAlign: TextAlign.center,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSize.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MSButton.gradient(
                onPressed: onPressed,
                width: 85,
                height: 20,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFD933), Color(0xFFFFAA00)],
                ),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1, color: ColorName.black.withOpacity(0.5)),
                child: MSText.bold('예', color: ColorName.white, fontSize: 12,),
              ),

              AppSize.width(10),

              MSButton.gradient(
                onPressed: () {
                  context.pop();
                },
                width: 85,
                height: 20,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF77C9D), Color(0xFFBB1252)],
                ),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1, color: ColorName.black.withOpacity(0.5)),
                child: MSText.bold('아니오', color: ColorName.white, fontSize: 12,),
              ),

              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     maximumSize: Size(80, 20),
              //     minimumSize: Size(80, 20),
              //     backgroundColor: ColorName.danger,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(4),
              //     ),
              //   ),
              //   onPressed: () { Navigator.of(context).pop(); },
              //   child: Text('아니오', style: TextStyle(fontSize: 12),),
              // ),
            ],
          ),
          AppSize.shrink(),
        ],
      ),
    );
  }
}

// #268EC9
Future<void> mSAlert(BuildContext context, {required String title, required String content,}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(child: MSAlert(title: title, content: content, onPressed: () {},),);
    }
  );
}

