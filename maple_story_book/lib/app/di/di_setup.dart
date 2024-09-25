import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/di/di_setup.config.dart';

///
/// @Project name    : maple_story_book
/// @Class           : di_setup.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 25..
/// Description      : 
///

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();