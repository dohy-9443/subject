import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/components/components.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/maple_story_text.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_equipment.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 21..
/// Description      : 
///


enum RadioTap {
  basic, cash, skin, and;
}

class HomeEquipment extends StatefulWidget {
  final ItemEquipment itemEquipment;
  const HomeEquipment({super.key, required this.itemEquipment});

  @override
  State<HomeEquipment> createState() => _HomeEquipmentState();
}

class _HomeEquipmentState extends State<HomeEquipment> {

  RadioTap selectedTap = RadioTap.basic;

  @override
  void initState() {
    super.initState();
    // context.read<HomeBloc>().add(GetHomeEvent<ItemEquipment>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
    // context.read<HomeBloc>().add(GetHomeEvent<SetEffect>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
    // context.read<HomeBloc>().add(GetHomeEvent<SymbolEquipment>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
  }


  @override
  Widget build(BuildContext context) {
    final List<String> radioTexts = ['기본', '캐시', '스킨', '안드'];

    return Container(
      padding: AppInset.all8,
      decoration: BoxDecoration(
        color: ColorName.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CustomRadioButton(
              elevation: 0,
              unSelectedColor: ColorName.white,
              buttonLables: radioTexts,
              buttonValues: RadioTap.values,
              defaultSelected: RadioTap.basic,
              width: 80,
              enableShape: true,
              buttonTextStyle: ButtonTextStyle(
                selectedColor: Colors.white,
                unSelectedColor: Colors.black,
                textStyle: GoogleFonts.roboto()),
              radioButtonValue: onEquipmentRadioSelected,
              selectedColor: ColorName.mainAccent,
            ),
          ),
          AppSize.height(8),
          if (selectedTap == RadioTap.basic)
          RoundSquare(
            backgroundColor: Colors.transparent,
            child: StaggeredGrid.count(
              crossAxisCount: 5, // 가로 배열
              mainAxisSpacing: 8, // 수평 틈새
              crossAxisSpacing: 8, // 수직 틈새
              children: [
                // Container(color: ColorName.legendaryColor, width: 50, height: 50, child: MSText(widget.itemEquipment.itemEquipment.length.toString()),),
                ...List.generate(30, (index) => null).mapIndexed((index, item) {
                  if (index == 1 || index == 3 || index == 8 || index == 25 || index == 26 || index == 28) {
                    return StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Container(width: 70, height: 70, color: Colors.transparent,),
                    );
                  } else {
                    return StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: EquipmentBox(
                        // items: widget.itemEquipment.itemEquipment,
                        items: [],
                        index: index,
                      )
                    );
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onEquipmentRadioSelected(RadioTap value) {
    selectedTap = value;
    print("selectedTap : $selectedTap");
    switch (value) {

      case RadioTap.basic:
        // context.read<HomeBloc>().add(GetHomeEvent<ItemEquipment>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
        // context.read<HomeBloc>().add(GetHomeEvent<SetEffect>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
        // context.read<HomeBloc>().add(GetHomeEvent<SymbolEquipment>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
        break;
      case RadioTap.cash:
        context.read<HomeBloc>().add(GetHomeEvent<CashItemEquipment>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
        break;
      case RadioTap.skin:
        context.read<HomeBloc>().add(GetHomeEvent<BeautyEquipment>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
        break;
      case RadioTap.and:
        context.read<HomeBloc>().add(GetHomeEvent<AndroidEquipment>(ocid: "3a7535b853b41574db55d045a91d56a6efe8d04e6d233bd35cf2fabdeb93fb0d"));
        break;
    }
  }
}
