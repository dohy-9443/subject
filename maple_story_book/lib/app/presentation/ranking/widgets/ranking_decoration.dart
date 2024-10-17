import 'package:flutter/material.dart';

BoxDecoration rankingDecoration(int ranking) {
  Color borderColor;
  Color backgroundColor;

  switch (ranking) {
    case 1:
      borderColor = Colors.red;
      backgroundColor = Colors.red.withOpacity(0.5);
      break;
    case 2:
      borderColor = Colors.orange;
      backgroundColor = Colors.orange.withOpacity(0.5);
      break;
    case 3:
      borderColor = Colors.blue;
      backgroundColor = Colors.blue.withOpacity(0.5);
      break;
    default:
      borderColor = Colors.grey;
      backgroundColor = Colors.grey.withOpacity(0.5);
  }

  return BoxDecoration(
    border: Border.all(color: borderColor, width: 1),
    color: backgroundColor,
    borderRadius: BorderRadius.circular(5),
  );
}
