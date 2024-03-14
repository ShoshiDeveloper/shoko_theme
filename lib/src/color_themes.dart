import 'dart:async';

import 'package:flutter/material.dart';

enum ThemesC {
  dark, light
}

class SomeTheme {
  static ThemesC themesC = ThemesC.dark;
  static StreamController controller = StreamController();
  static initTheme() {
    SomeTheme.controller.add(ThemesC.light);
  }
}

class ThemeWidget extends StatefulWidget {
  final Widget child;
  const ThemeWidget({super.key,required this.child});

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }
  (context as Element).visitChildren(rebuild);
}
  
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: SomeTheme.controller.stream,
      builder: (context, snapshot) {
        SomeTheme.themesC = snapshot.data ?? ThemesC.dark;
        print(SomeTheme.themesC);
        rebuildAllChildren(context);
        return widget.child;
      },
    );
  }
}

extension SomeThemeExtens on BuildContext {
  changeTheme() {
    SomeTheme.controller.add(SomeTheme.themesC == ThemesC.light ? ThemesC.dark : ThemesC.light);
    print(SomeTheme.themesC.toString());
  }
  Color getColor() => SomeTheme.themesC == ThemesC.dark ? Colors.black : Colors.white;
}