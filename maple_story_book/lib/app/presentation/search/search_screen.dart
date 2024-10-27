import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/search/components/components.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : search_screen.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 1..
/// Description      : 
///

@RoutePage()
class SearchScreen extends StatefulWidget {

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Random _random = Random();
  final FocusNode _focusNode = FocusNode();
  List<_LeafAnimation> _leafAnimations = [];
  bool _showLeaves = true;

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

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _showLeaves = false;
        });
        _animationController.stop();
      } else {
        Future.delayed(Duration(milliseconds: 600), () {
          setState(() {
            _showLeaves = true;
          });
          _animationController.reset();
          _animationController.repeat();
        });
      }
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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initializeLeafAnimations(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(color: ColorName.mainAccent,),
            Visibility(
              visible: _showLeaves,
                child: Stack(
                  children: [
                    ..._leafAnimations.map((leaf) => leaf.build(context))
                  ],
                ),
            ),
            SearchContents(
              focusNode: _focusNode,
            ),
          ],
        ),
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
        final dy = (speed * animationValue * screenHeight);
        final newTop = top + dy;
        final newLeft = left % screenWidth;
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