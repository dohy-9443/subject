import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/components/components.dart';
import 'package:maple_story_book/core/util/bloc/base_state.dart';
import 'package:maple_story_book/tool/component/component.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_bloc_consumer.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

class HomeBlocConsumer extends StatelessWidget {
  const HomeBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, IHomeState>(
      listener: (BuildContext context, IHomeState state) {

      },
      builder: (BuildContext context, IHomeState state) {
        return Container();
        // return state.when<Widget>(
        //   initial: () => MSLoading(),
        //   success: (data) => HomeSuccessWidget(data: data as HomeData),
        //   error: (error, StackTrace? stackTrace) => HomeErrorWidget(error: error),
        //   // orElse: () => Container(),
        // );
      },
    );
  }
}
