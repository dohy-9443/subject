import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/router/app_router.gr.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : main_screen.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 29.
/// Description      :
///

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        RankingRoute(),
        AllRoute(),
      ],
      transitionBuilder: (BuildContext context, Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child,);
      },
      builder: (BuildContext context, Widget child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            selectedItemColor: ColorName.mainAccent,
            onTap: (int index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Ranking'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All'),
            ],
          ),
        );
      },
    );
  }
}
