import 'dart:math';
import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/component/component.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : seach_screen.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Random _random = Random();
  List<_LeafAnimation> _leafAnimations = [];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 130),
      vsync: this,
    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeLeafAnimations(context);
    });
  }

  void _initializeLeafAnimations(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    setState(() {
      _leafAnimations = List.generate(70, (index) {
        return _LeafAnimation(
          left: _random.nextDouble() * screenWidth,
          top: -_random.nextDouble() * 100,
          size: 30 + _random.nextDouble() * 50,
          speed: 5,
          delay: 30 + _random.nextDouble() * 50,
          animationController: _animationController,
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          random: _random,
        );
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initializeLeafAnimations(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(color: ColorName.mainAccent,),
          ..._leafAnimations.map((leaf) => leaf.build(context)).toList(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: MSText.taengGu(
                    '캐릭터의 닉네임을\n 입력해주세요.',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.images.orange.path),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LeafAnimation {
  final double left;
  final double top;
  final double size;
  final double speed;
  final double delay;
  final double screenWidth;
  final double screenHeight;
  final AnimationController animationController;
  final Random random;

  _LeafAnimation({
    required this.left,
    required this.top,
    required this.size,
    required this.speed,
    required this.delay,
    required this.animationController,
    required this.screenWidth,
    required this.screenHeight,
    required this.random,
  });

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final animationValue = (animationController.value + delay) % 1.0;
        final dx = 0;
        final dy = (speed * animationValue * screenHeight);
        final newTop = top + dy;
        final newLeft = (left + dx) % screenWidth;

        return Positioned(
          left: newLeft,
          top: newTop,
          child: Transform.rotate(
            angle: animationValue * 2 * pi,
            child: Image.asset(
              Assets.icons.logoIcon.path,
              width: size,
              height: size,
            ),
          ),
        );
      },
    );
  }
}