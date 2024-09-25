import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_book_app.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      :
///

class MapleStoryBookApp extends StatelessWidget {
  const MapleStoryBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '메이플 스토리 북',
      theme: ThemeData(fontFamily: FontFamily.taengGu),
      home: Scaffold(
        body: BlocBuilder<HomeBloc, IHomeState>(
          builder: (context, state) {
            if (state is HomeLoading || state is HomeInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HomeError) return Text(state.error);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.ocid.toString()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
