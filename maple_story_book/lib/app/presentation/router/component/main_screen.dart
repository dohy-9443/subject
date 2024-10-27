import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/router/app_router.gr.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : scaffold_nav_bar.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      :
///

// class ScaffoldNavBar extends StatefulWidget {
//   final Widget child;
//
//   const ScaffoldNavBar({super.key, required this.child});
//
//   @override
//   State<ScaffoldNavBar> createState() => _ScaffoldNavBarState();
// }
//
// class _ScaffoldNavBarState extends State<ScaffoldNavBar> {
//   int _selectedIndex = 0;
//
//   void _onClicked(int index) {
//     setState(() {
//       _selectedIndex = index;
//
//       switch (index) {
//         case 0:
//           // context.go('/');
//           break;
//         case 1:
//           // context.go('/ranking');
//           break;
//         case 2:
//           // context.go('/all');
//           break;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorName.lightBg,
//       body: widget.child,
//       bottomNavigationBar: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.bar_chart), label: 'Ranking'),
//             BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All'),
//           ],
//           backgroundColor: ColorName.lightBg,
//           selectedItemColor: ColorName.mainAccent,
//           unselectedItemColor: ColorName.lightGray3,
//           currentIndex: _selectedIndex,
//           onTap: (int index) => _onClicked(index)
//       ),
//     );
//   }
// }

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
