import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/components/components.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/component/component.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_screen.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      :
///

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => MSBlocConsumer<HomeBloc, IHomeState, HomeSuccess>(
      initFunc: initFunction,
      bloc: context.read<HomeBloc>(),
      successEmpty: MSEmpty(description: "데이터가 없습니다.",),
      success: (context, successState) {
        return HomeSuccessWidget(state: successState,);
      },
      errorPressed: () {},
      errorFullScreenPressed: () {}
  );

  initFunction(BuildContext context) {
    context.read<HomeBloc>().add(GetHomeEvent<BasicInfo>(ocid: "36c54981582f63ef732f51a1216299d2"));
  }
}

