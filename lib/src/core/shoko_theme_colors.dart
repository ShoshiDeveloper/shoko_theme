import 'package:colors_theme/src/core/shoko_theme.dart';
import 'package:flutter/material.dart';

class ShokoThemeColors {
  late Map<String, Color> _darkColors;
  late Map<String, Color> _lightColors;

  Map<String, Color> colors(ShokoThemes theme) => theme == ShokoThemes.dark ? _darkColors : _lightColors;
  ShokoThemeColors(this._darkColors, this._lightColors);
  ShokoThemeColors.fromJSON(Map<String, dynamic> lightFileChapter, Map<String, dynamic> darkFileChapter) {
    _lightColors = {};
    _darkColors = {};

    for (final el in lightFileChapter.entries) {
      List<num> rgb = (el.value as String).split(',').map((e) => int.parse(e)).toList();
      print(rgb);
      _lightColors.addAll({el.key : Color.fromRGBO(rgb[0].toInt(), rgb[1].toInt(), rgb[2].toInt(), rgb[3].toDouble())});
    }
    
    for (final el in darkFileChapter.entries) {
      List<int> rgb = (el.value as String).split(',').map((e) => int.parse(e)).toList();
      print(rgb);
      _darkColors.addAll({el.key : Color.fromRGBO(rgb[0].toInt(), rgb[1].toInt(), rgb[2].toInt(), rgb[3].toDouble())});
    }
  }
}
