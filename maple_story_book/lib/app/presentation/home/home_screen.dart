import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/view/view.dart';
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
      success: (context, successState) => HomeFragment(state: successState,),
      errorPressed: () {},
      errorFullScreenPressed: () {}
  );

  initFunction(BuildContext context) {
    context.read<HomeBloc>().add(GetHomeEvent<BasicInfo>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
    context.read<HomeBloc>().add(GetHomeEvent<Stat>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
  }
}

