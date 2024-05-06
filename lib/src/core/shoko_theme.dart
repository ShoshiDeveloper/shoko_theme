import 'dart:async';
import 'dart:convert';

import 'package:colors_theme/src/core/shoko_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ShokoThemes {
  dark, light
}

abstract class ShokoThemeCore {
  static ShokoThemes currentTheme = ShokoThemes.dark;
  static StreamController controller = StreamController();

  // static Map<String, dynamic>? colors;
  static ShokoThemeColors? backgroud;
  static ShokoThemeColors? content;
  static ShokoThemeColors? actions;
  static ShokoThemeColors? border;


  ///Param `filePath` default is 'assets/jsons/color_themes.json'
  static Future initTheme({ShokoThemes? initTheme, String? filePath}) async {
    controller.add(initTheme ?? ShokoThemes.light);
    //there init colors from json file
    await readColorsFile();
  }

  static Future readColorsFile([String? filePath]) async {
    final String fileText = await rootBundle.loadString(filePath ?? 'assets/jsons/color_themes.json');
    final map = jsonDecode(fileText);
    print(map);
    backgroud = ShokoThemeColors.fromJSON(map["light"]["background"], map["dark"]["background"]);
    // backgroud = const ShokoThemeColors(
    //   {
    //     "brand": Colors.amber
    //   },
    //   {
    //     "brand": Colors.deepPurpleAccent
    //   }
    //   );
  }
}
