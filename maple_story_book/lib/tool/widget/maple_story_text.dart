import 'package:auto_size_text/auto_size_text.dart';
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
  final bool autoSize;
  final int? maxLines;
  final double minFontSize;
  final List<Shadow>? shadow;

  const MSText(
    this.text, {
      super.key,
      this.color = ColorName.lightText,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 16,
      this.isGoogleFont = true,
      this.textAlign = TextAlign.left,
      this.autoSize = false,
      this.maxLines = null,
      this.minFontSize = 12,
      this.shadow = null,
    }
  );

  factory MSText.basic(
    String text, {
      double fontSize = 16,
      TextAlign textAlign = TextAlign.left,
      Color color = ColorName.lightText,
      List<Shadow>? shadow,
  }) => MSText(
    text,
    fontSize: fontSize,
    textAlign: textAlign,
    color: color,
    shadow: shadow,
  );

  factory MSText.bold(
    String text, {
      double fontSize = 16,
      TextAlign textAlign = TextAlign.left,
      Color color = ColorName.lightText,
      List<Shadow>? shadow,
  }) => MSText(
    text,
    fontWeight: FontWeight.bold,
    fontSize: fontSize,
    textAlign: textAlign,
    color: color,
    shadow: shadow,
  );

  factory MSText.danger(
    String text, {
      double fontSize = 16,
      TextAlign textAlign = TextAlign.left,
      FontWeight fontWeight = FontWeight.bold,
      List<Shadow>? shadow,
  }) => MSText(
    text,
    color: ColorName.danger,
    fontWeight: fontWeight,
    fontSize: fontSize,
    textAlign: textAlign,
    shadow: shadow,
  );

  factory MSText.taengGu(
    String text, {
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.normal,
      Color color = ColorName.black,
      TextAlign textAlign = TextAlign.left,
      List<Shadow>? shadow,
      }) {
    return MSText(
      text,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      isGoogleFont: false,
      textAlign: textAlign,
      shadow: shadow,
    );
  }

  factory MSText.autoSize(
    String text, {
    double fontSize = 16,
    int? maxLines,
    FontWeight fontWeight = FontWeight.normal,
    Color color = ColorName.black,
    TextAlign textAlign = TextAlign.left,
    double minFontSize = 12,
    List<Shadow>? shadow,
  }) {
    return MSText(
      text,
      maxLines: maxLines,
      fontWeight: fontWeight,
      color: color,
      autoSize: true,
      textAlign: textAlign,
      minFontSize: minFontSize,
      shadow: shadow,
    );
  }

  @override
  Widget build(BuildContext context) {
    return autoSize ? AutoSizeText(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      minFontSize: minFontSize,
      overflow: TextOverflow.ellipsis,
      style: isGoogleFont ? GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        shadows: shadow,
      ) :
      TextStyle(
        fontFamily: FontFamily.taengGu,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        shadows: shadow,
      ),
    ) : Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: isGoogleFont ? GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        shadows: shadow,
      ) :
      TextStyle(
        fontFamily: FontFamily.taengGu,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        shadows: shadow,
      ),
    );
  }
}
