import 'package:flutter/material.dart';

///
/// @Project name    : bdh_subject
/// @Class           : route.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 17..
/// Description      : 
///

enum MapleStoryBookRoute {
  root, detail, unknown;

  static String encode(MapleStoryBookRoute value) => value.path;

  static MapleStoryBookRoute decode(String value) {
    return MapleStoryBookRoute.values.firstWhere((element) {
      return element.path == value;
    }, orElse: () {
      return MapleStoryBookRoute.unknown;
    });
  }
}

abstract class IMapleStoryBookRoutes {
  static Route<dynamic> find(RouteSettings settings) {
    final Uri uri = Uri.tryParse(settings.name ?? '') ?? Uri();
    final Map<String, String> queryParameters = { ...uri.queryParameters };
    final bool fullScreenDialog = bool.tryParse(queryParameters['fullscreenDialog'] ?? '') ?? false;

    return MaterialPageRoute(
      builder: (BuildContext context) => findScreen(uri),
      settings: settings,
      fullscreenDialog: fullScreenDialog,
    );
  }

  static Widget findScreen(Uri uri) {
    final MapleStoryBookRoute route = MapleStoryBookRoute.decode(uri.path);

    switch (route) {
      case MapleStoryBookRoute.root:
        return const SizedBox();
      case MapleStoryBookRoute.detail:
        return const SizedBox();
      case MapleStoryBookRoute.unknown:
        return const SizedBox();
    }
  }
}

extension MapleStoryBookRouteExtension on MapleStoryBookRoute {
  String get path {
    const String root = '/';
    if (this == MapleStoryBookRoute.root) return root;
    return '$root$name';
  }
}
