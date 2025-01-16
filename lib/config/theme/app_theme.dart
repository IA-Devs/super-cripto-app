import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.deepPurple,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0,
            'Selected color should be equal or greater than zero'),
        assert(selectedColor < colorList.length,
            'Selected color should minor than ${colorList.length}');

  ThemeData getTheme() {
    return ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false));
  }

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
