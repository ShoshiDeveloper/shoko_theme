
import 'package:colors_theme/colors_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ShokoThemeCore.initTheme();
  // ColorThemes.initialized(await rootBundle.loadString("assets/color_themes.json"));

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShokoThemeWidget(
      child: MaterialApp(
        home: BasePage(),
      )
    );
  }
}

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 25,
              color: context.backgroud["brand"],
            ),
            ElevatedButton(onPressed: () async {
              await Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()));
            }, child: Text('HUAIFUHASUF')),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
                context.changeTheme();

        }, child: Text('pidor')),
      ),
    );
  }
}