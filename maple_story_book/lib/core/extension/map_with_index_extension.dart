///
/// @Project name    : maple_story_book
/// @Class           : map_with_index_extension.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 15..
/// Description      :
///

extension MapWithIndex<T> on List<T> {
  List<R> mapWithIndex<R>(R Function(T, int i) callback) {
    List<R> result = [];
    for (int i = 0; i < length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }

  Future<List<R>> mapWithFutureIndex<R>(R Function(T, int i) callback) async {
    List<R> result = [];
    for (int i = 0; i < length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }
}
