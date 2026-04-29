import 'package:flutter/material.dart';

const Color customColor = Color(0xFF6366F1);

const List<Color> primaryColors = [
  Color.fromARGB(255, 184, 241, 99),
  Color.fromARGB(255, 246, 118, 92),
  Color(0xFFA855F7),
  Color(0xFFC084FC),
  Color(0xFFD946EF),
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 1})
    : assert(
        selectedColor >= 0 && selectedColor <= primaryColors.length -1,
        'selectedColor must be between 0 and ${primaryColors.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: primaryColors[selectedColor],
      brightness: Brightness.dark,
    );
  }
}
