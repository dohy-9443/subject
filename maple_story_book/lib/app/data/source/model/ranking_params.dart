class RankingParams {
  final DateTime date;
  final String? worldName;
  final String? ocid;
  final int? page;

  RankingParams({required this.date, this.worldName = '', this.ocid = '', this.page = 1});
}