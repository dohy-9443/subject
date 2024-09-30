import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/maple_story_book_app.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';

import 'app/data/repository/repository.dart';
import 'app/data/source/source.dart';
import 'app/di/di_setup.dart';
import 'app/domain/repository/maple_story/character.dart';
import 'tool/network/network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
      MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext context) => HomeBloc(
          GetAbilityUseCase(ICharacterRepository as ICharacterRepository),
          GetCharacterBasicUseCase(ICharacterRepository as ICharacterRepository),
          GetPropensityUseCase(ICharacterRepository as ICharacterRepository),
          GetPopularityUseCase(ICharacterRepository as ICharacterRepository),
          GetItemEquipmentUseCase(ICharacterRepository as ICharacterRepository),
          GetCashItemEquipmentUseCase(ICharacterRepository as ICharacterRepository),
          GetSetEffectUseCase(ICharacterRepository as ICharacterRepository),
          GetSymbolEquipmentUseCase(ICharacterRepository as ICharacterRepository),
          GetStatUseCase(ICharacterRepository as ICharacterRepository),
          GetHyperStatUseCase(ICharacterRepository as ICharacterRepository),
          GetPetEquipmentUseCase(ICharacterRepository as ICharacterRepository),
          GetBeautyEquipmentUseCase(ICharacterRepository as ICharacterRepository),
          GetAndroidEquipmentUseCase(ICharacterRepository as ICharacterRepository),
          GetSkillInfoUseCase(ICharacterRepository as ICharacterRepository),
          GetLinkSkillUseCase(ICharacterRepository as ICharacterRepository),
          GetVMatrixUseCase(ICharacterRepository as ICharacterRepository),
          GetHexaMatrixInfoUseCase(ICharacterRepository as ICharacterRepository),
          GetHexaMatrixStatUseCase(ICharacterRepository as ICharacterRepository),
          GetStudioUseCase(ICharacterRepository as ICharacterRepository),
      ),)
    ],
    child: const MapleStoryBookApp(),
  ));
}
