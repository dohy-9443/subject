import 'package:auto_route/auto_route.dart';
import 'package:maple_story_book/app/presentation/router/app_router.gr.dart';

///
/// @Project name    : maple_story_book
/// @Class           : app_router.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      : shinheetae -> baekdonghyun fix
///

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: MainRoute.page,
      children: [
        AutoRoute(path: 'home', page: HomeRoute.page),
        AutoRoute(
          path: 'ranking',
          page: RankingRoute.page,
          children: [
            AutoRoute(path: 'detail', page: RankingDetailRoute.page),
          ],
        ),
        AutoRoute(
          path: 'all',
          page: AllRoute.page,
          children: [
            AutoRoute(path: 'guild', page: GuildRoute.page),
            AutoRoute(path: 'notice', page: NoticeRoute.page),
            AutoRoute(path: 'potential', page: PotentialRoute.page),
            AutoRoute(path: 'starForce', page: StarForceRoute.page),
          ],
        ),
      ]
    ),
  ];
}