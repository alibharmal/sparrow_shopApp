import 'package:flutter/material.dart';

final ThemeData appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFF9F6F0),
    scaffoldBackgroundColor: const Color(0xFFF9F6F0),
    colorScheme: ColorScheme.fromSwatch().copyWith(primary: const Color(0xFFF9F6F0)),
    primaryColor: Colors.black,
      chipTheme:_chipAppTheme(),
  );
}
ChipThemeData _chipAppTheme() {
  const ChipThemeData base =  ChipThemeData();
  return base.copyWith(
      brightness: Brightness.light,
      backgroundColor:Colors.white,
      shadowColor: Colors.black38,
  );
}

