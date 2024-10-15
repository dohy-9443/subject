import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_center.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 14..
/// Description      : 
///

class HomeCenter extends StatelessWidget {
  final Stat stat;

  const HomeCenter({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    print("stat.characterClass : ${stat.characterClass}");
    print("");
    print("stat.finalStat : ${stat.finalStat}");

    return const Placeholder();
  }
}
