import 'package:freezed_annotation/freezed_annotation.dart';

part 'popularity.freezed.dart';
part 'popularity.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : popularity.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

@freezed
class Popularity with _$Popularity {
  const factory Popularity({
    String? date,
    @Default(0) int popularity,
  }) = _Popularity;

  factory Popularity.fromJson(Map<String, dynamic> json) => _$PopularityFromJson(json);

  static (String?, int) getPopularity(Popularity popularity) {
    return (
      popularity.date,
      popularity.popularity
    );
  }
}