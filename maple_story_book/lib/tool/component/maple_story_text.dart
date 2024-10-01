import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_story_book/tool/theme/colors.dart';
import 'package:maple_story_book/tool/theme/fonts.gen.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_text.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 22..
/// Description      : 
///

class MSText extends StatelessWidget {

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final bool isGoogleFont;
  final TextAlign textAlign;

  const MSText(
    this.text, {
      super.key,
      this.color = ColorName.lightText,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 16,
      this.isGoogleFont = true,
      this.textAlign = TextAlign.left,
    }
  );

  factory MSText.basic(String text, {double fontSize = 16, TextAlign textAlign = TextAlign.left,}) => MSText(text, fontSize: fontSize, textAlign: textAlign,);

  factory MSText.bold(String text, {double fontSize = 16, TextAlign textAlign = TextAlign.left,}) => MSText(text, fontWeight: FontWeight.bold, fontSize: fontSize, textAlign: textAlign,);

  factory MSText.danger(String text, {double fontSize = 16, TextAlign textAlign = TextAlign.left,}) => MSText(text, color: ColorName.danger, fontSize: fontSize, textAlign: textAlign,);

  factory MSText.taengGu(
    String text, {
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.normal,
      Color color = ColorName.black,
      TextAlign textAlign = TextAlign.left,
      }) {
    return MSText(text, fontSize: fontSize, fontWeight: fontWeight, color: color, isGoogleFont: false, textAlign: textAlign);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: isGoogleFont ? GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ) :
      TextStyle(
        fontFamily: FontFamily.taengGu,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
