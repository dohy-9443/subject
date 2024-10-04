import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/search_favorite_list/search_favorite_list_screen.dart';
import 'package:maple_story_book/tool/component/component.dart';

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
  Widget build(BuildContext context) {
    // return Center(
    //   child: ElevatedButton(onPressed: () async {
    //     mSAlert(context, title: 'dsf', content: 'asdfasdf');
    //   }, child: Text("button"))
    // );

    return SearchFavoriteListScreen();
  }
}
