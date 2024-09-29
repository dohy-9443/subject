import 'package:equatable/equatable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_state.
/// @Created by      : shineheetae.
/// Created On       : 2024. 9. 18..
/// Description      :
///

sealed class IHomeState extends Equatable {}

class HomeInitial extends IHomeState {
  HomeInitial();

  @override
  List<Object?> get props => [];
}

class HomeSuccess extends IHomeState {
  final bool isLoading;
  final Ocid? ocid;
  final Ability? ability;
  final BasicInfo? basicInfo;
  final ItemEquipment? itemEquipment;

  HomeSuccess({
    this.isLoading = false,
    this.ocid,
    this.ability,
    this.basicInfo,
    this.itemEquipment,
  });

  HomeSuccess copyWith({
    bool? isLoading,
    Ocid? ocid,
    Ability? ability,
    BasicInfo? basicInfo,
    ItemEquipment? itemEquipment,
  }) {
    return HomeSuccess(
      isLoading: isLoading ?? this.isLoading,
      ocid: ocid ?? this.ocid,
      ability: ability ?? this.ability,
      basicInfo: basicInfo ?? this.basicInfo,
      itemEquipment: itemEquipment ?? this.itemEquipment,
    );
  }

  @override
  List<Object?> get props => [ocid, ability, basicInfo, itemEquipment];
}

class HomeError extends IHomeState {
  final dynamic error;
  final StackTrace? stackTrace;

  HomeError({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [];
}
