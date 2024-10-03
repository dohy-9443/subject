
import 'package:json_annotation/json_annotation.dart';

///
/// @Project name    : maple_story_book
/// @Class           : local_storage.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      : 
///

part 'local_storage.g.dart';

@JsonSerializable()
class LocalStorageModel {
  final String nickName;
  final String ocid;

  LocalStorageModel({required this.nickName, required this.ocid});

  factory LocalStorageModel.fromJson(Map<String, dynamic> json) => _$LocalStorageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocalStorageModelToJson(this);
}

@JsonSerializable()
class ListLocalStorageModel {
  final List<LocalStorageModel> localStorages;

  ListLocalStorageModel({required this.localStorages});

  factory ListLocalStorageModel.fromJson(Map<String, dynamic> json) => _$ListLocalStorageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListLocalStorageModelToJson(this);
}