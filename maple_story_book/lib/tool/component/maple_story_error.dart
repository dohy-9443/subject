import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/maple_story_text.dart';
import 'package:maple_story_book/tool/widget/maple_stroy_button.dart';

Future<void> mSErrorDialog(
  BuildContext context, {
  required VoidCallback? onPressed,
  required Exception? error,
}) async {
  return showDialog<void>(
    context: context,
    useRootNavigator: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: ColorName.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: ColorName.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorName.beige,
          ),
          margin: AppInset.all4,
          padding: AppInset.all4,
          height: 200,
          width: 450,
          child: Stack(
            children: [
              Positioned(
                bottom: -20,
                right: -10,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.images.orange.path),
                      colorFilter: const ColorFilter.mode(
                          ColorName.beige, BlendMode.saturation),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MSText.bold(
                      error == null ? '서버와의 연결이 끊겼습니다.' : error.toString(),
                      color: const Color(0xFF7B5C47),
                      fontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                    AppSize.height(30),
                    MSButton.basic(
                      onPressed: onPressed ?? () => context.pop(),
                      width: 100,
                      height: 30,
                      backgroundColor: const Color(0xFF7B5C47).withOpacity(0.2),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFF7B5C47),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      child: const OutlineText(
                        Text(
                          '확인',
                          style: TextStyle(
                            color: ColorName.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(1.0),
                        ),
                        strokeColor: Color(0xFF7B5C47),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class OutlineText extends StatelessWidget {
  final Text child;
  final double strokeWidth;
  final Color? strokeColor;
  final TextOverflow? overflow;

  const OutlineText(
    this.child, {
    super.key,
    this.strokeWidth = 2,
    this.strokeColor,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 테두리 효과
        Text(
          textScaler: child.textScaler,
          child.data!,
          style: TextStyle(
            fontSize: child.style?.fontSize,
            fontWeight: child.style?.fontWeight,
            foreground: Paint()
              ..color = strokeColor ?? Theme.of(context).shadowColor
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth,
          ),
          overflow: overflow,
        ),
        child
      ],
    );
  }
}