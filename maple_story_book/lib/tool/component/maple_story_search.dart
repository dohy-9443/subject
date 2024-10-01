import 'package:flutter/material.dart';
import 'package:maple_story_book/core/util/insets.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : search.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 22..
/// Description      : 
///

class MSSearchBar extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final VoidCallback onTap;

  const MSSearchBar({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInset.edgeInsetsValue([20, 40]),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        cursorColor: ColorName.white,
        cursorWidth: 3,
        cursorErrorColor: ColorName.danger,
        style: const TextStyle(color: ColorName.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          contentPadding: AppInset.all10,
          fillColor: ColorName.mainAccent,
          filled: true,
          labelStyle: const TextStyle(
            color: ColorName.white,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: const TextStyle(
            color: ColorName.lightGray3,
            fontWeight: FontWeight.normal
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorName.white, width: 4),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorName.white, width: 4),
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: focusNode.hasFocus ?
            IconButton(
              onPressed: () => controller.clear(),
              icon: const Icon(
                Icons.cancel,
                color: ColorName.white,
              )
            ) : null,
        ),
      ),
    );
  }
}
