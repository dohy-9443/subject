import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/home/components/home_bloc_consumer.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_screen.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      :
///

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => HomeBlocConsumer();
}

