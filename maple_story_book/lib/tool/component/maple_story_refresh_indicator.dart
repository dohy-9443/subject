import 'package:flutter/material.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_refresh_indicator.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 9..
/// Description      :
///

class MSRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const MSRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }
}
