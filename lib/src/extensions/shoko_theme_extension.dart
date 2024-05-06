import 'package:colors_theme/src/core/shoko_theme.dart';
import 'package:flutter/material.dart';

extension SomeThemeExtension on BuildContext {
  changeTheme() {
    ShokoThemeCore.controller.add(ShokoThemeCore.currentTheme == ShokoThemes.light ? ShokoThemes.dark : ShokoThemes.light);
  }
  // Color getColor() => ShokoThemeCore.themesC == ShokoThemes.dark ? Colors.black : Colors.white;
  Map<String, Color> get backgroud => ShokoThemeCore.backgroud!.colors(ShokoThemeCore.currentTheme);
  Map<String, Color> get content => ShokoThemeCore.content!.colors(ShokoThemeCore.currentTheme);
  Map<String, Color> get actions => ShokoThemeCore.actions!.colors(ShokoThemeCore.currentTheme);
  Map<String, Color> get borders => ShokoThemeCore.border!.colors(ShokoThemeCore.currentTheme);
}