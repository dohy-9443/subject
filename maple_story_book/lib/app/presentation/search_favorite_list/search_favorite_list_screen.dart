import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:maple_story_book/tool/theme/colors.dart';

///
/// @Project name    : maple_story_book
/// @Class           : search_favorite_list_screen.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 4..
/// Description      : 
///

class SearchFavoriteListScreen extends StatelessWidget {
  const SearchFavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50 + kToolbarHeight,
          color: ColorName.modal,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 5, // 가로 배열
              mainAxisSpacing: 8, // 수평 틈새
              crossAxisSpacing: 8, // 수직 틈새
              children: const [
                StaggeredGridTile.count(
                  crossAxisCellCount: 3, // 가로로 몇칸을 먹을 건지
                  mainAxisCellCount: 3, // 세로로 몇칸을 먹을 건지
                  child: Tile(index: 0),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Tile(index: 1),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 2,
                  child: Tile(index: 2),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: Tile(index: 3),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: Tile(index: 4),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 4,
                  child: Tile(index: 5),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 4,
                  child: Tile(index: 6),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 3,
                  child: Tile(index: 7),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 3,
                  child: Tile(index: 8),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: Tile(index: 9),
                ),
              ],
            ),
          ),
        ),
      ],
    );;
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.height,
    this.width,
    this.onTap,
  }) : super(key: key);

  final double? height;
  final double? width;
  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.red,
        height: height,
        width: width,
        child: Center(child: Text('$index')),
      ),
    );
  }
}