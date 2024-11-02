import 'package:equatable/equatable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : global_state.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      :
///

sealed class IGlobalState extends Equatable {}

final class GlobalInitial extends IGlobalState {
  GlobalInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class GlobalSuccess extends IGlobalState {
  final bool isLoading;
  final Ocid? ocid;
  final List<LocalStorageModel>? searches;
  final List<LocalStorageModel>? favorites;
  final List<Ocid>? rankerOcId;
  final DateTime? date;
  final String? characterName;
  final String? worldName;
  final String? characterGender;
  final String? characterClass;
  final int? characterClassLevel;
  final int? characterLevel;
  final String? characterExp;
  final String? characterExpRate;
  final String? characterGuildName;
  final String? characterImage;
  final String? characterDateCreate;
  final bool? accessFlag;
  final bool? liberationQuestClearFlag;
  final BasicInfo basicInfo;

  GlobalSuccess({
    this.isLoading = false,
    this.ocid,
    this.searches,
    this.favorites,
    this.rankerOcId = const [],
    this.date,
    this.characterName = '',
    this.worldName = '',
    this.characterGender = '',
    this.characterClass = '',
    this.characterClassLevel = 0,
    this.characterLevel = 0,
    this.characterExp = '',
    this.characterExpRate = '',
    this.characterGuildName = '',
    this.characterImage = '',
    this.characterDateCreate = '',
    this.accessFlag = false,
    this.liberationQuestClearFlag = false,
    this.basicInfo = const BasicInfo(),
  });

  GlobalSuccess copyWith({
    bool? isLoading,
    Ocid? ocid,
    List<LocalStorageModel>? searches,
    List<LocalStorageModel>? favorites,
    List<Ocid>? rankerOcId,
    BasicInfo? basicInfo,
  }) {
    return GlobalSuccess(
      isLoading: isLoading ?? this.isLoading,
      ocid: ocid ?? this.ocid,
      searches: searches ?? this.searches,
      favorites: favorites ?? this.favorites,
      rankerOcId: rankerOcId ?? this.rankerOcId,
      basicInfo: basicInfo ?? this.basicInfo,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        ocid,
        searches,
        favorites,
        rankerOcId,
        basicInfo,
      ];
}

final class GlobalError extends IGlobalState {
  final dynamic error;
  final StackTrace? stackTrace;

  GlobalError({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [error, stackTrace];
}
