import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/component.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

class MSOnboard extends StatefulWidget {
  final List<String> content;

  const MSOnboard({super.key, required this.content});

  @override
  State<MSOnboard> createState() => _MSOnboardState();
}

class _MSOnboardState extends State<MSOnboard> {
  final ScrollController _scrollController = ScrollController();
  bool _isOverflowing = false;
  int index = 0;
  bool isLast = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.position.maxScrollExtent > 0) {
        setState(() {
          _isOverflowing = true;
        });
      }
    });
  }

  void nextAction() {
    isLast = index < widget.content.length - 1;
    print('isLast : $isLast');

    if (isLast) {
      setState(() {
        _scrollController.jumpTo(0);  // 스크롤 초기화
        index++;  // index 증가
      });
    } else {
      Navigator.of(context).pop();  // 마지막 페이지면 모달 닫기
    }
  }

  void _scrollUp() {
    _scrollController.animateTo(
      _scrollController.offset - 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.offset + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppInset.all2,
      constraints: const BoxConstraints(
        maxHeight: 170,
      ),
      decoration: BoxDecoration(
        color: ColorName.onboard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 3,
          color: ColorName.black,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 146,
            decoration: BoxDecoration(
              color: const Color(0xFF625239),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: ColorName.black,
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.images.pink.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: AppInset.all2,
                  margin: AppInset.right4,
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF61CFEE), Color(0xFF04627C)],
                    ),
                    border: Border.all(
                      color: const Color(0xFF04627C),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: MSText.bold(
                    '핑크빈',
                    textAlign: TextAlign.center,
                    color: ColorName.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              right: 0,
              child: Container(
                padding: AppInset.all2,
                margin: AppInset.right4,
                child: MSButton.gradient(
                  onPressed: () {
                    nextAction();
                  },
                  width: 97,
                  height: 28,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFA8C311), Color(0xFF7E8E25)],
                  ),
                  border: Border.all(
                    color: const Color(0xFF483B29),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  child: MSText.bold(
                    isLast ? '완료' : '다음 >',
                    textAlign: TextAlign.center,
                    color: ColorName.white,
                    fontSize: 13,
                  ),
                ),
              )),
          Container(
            margin: AppInset.all10,
            width: 218,
            height: 120,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: AnimatedTextKit(
                repeatForever: false,
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(
                    widget.content[index],
                    textStyle: const TextStyle(
                      color: ColorName.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  if(index == 1)
                  TyperAnimatedText(
                    widget.content[1],
                    textStyle: const TextStyle(
                      color: ColorName.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),

                ],
              ),
            ),
          ),
          if (_isOverflowing)
            Positioned(
              left: 0,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: _scrollUp,
                    child: const Icon(Icons.arrow_upward),
                  ),
                  ElevatedButton(
                    onPressed: _scrollDown,
                    child: const Icon(Icons.arrow_downward),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

Future<void> mSOnboard(BuildContext context,
    {required List<String> contentList}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: MSOnboard(content: contentList),
      );
    },
  );
}
