import 'package:colors_theme/src/core/shoko_theme.dart';
import 'package:flutter/material.dart';

class ShokoThemeWidget extends StatefulWidget {
  final Widget child;
  const ShokoThemeWidget({super.key,required this.child});

  @override
  State<ShokoThemeWidget> createState() => _ShokoThemeWidgetState();
}

class _ShokoThemeWidgetState extends State<ShokoThemeWidget> {
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
      stream: ShokoThemeCore.controller.stream,
      builder: (context, snapshot) {
        ShokoThemeCore.currentTheme = snapshot.data ?? ShokoThemes.dark;
        rebuildAllChildren(context);
        return widget.child;
      },
    );
  }
}
