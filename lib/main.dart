import 'package:flutter/material.dart';
import 'package:pick_your_poison/pages/home_page.dart';
import 'package:pick_your_poison/pages/mushroom_designer.dart';
import 'package:pick_your_poison/pages/tutorial.dart';
import 'package:pick_your_poison/pages/prediction_page.dart';
import 'package:pick_your_poison/pages/species_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/tutorial': (context) => Tutorial(),
        '/mushroom_designer': (context) => MushroomDesigner(),
        '/prediction_page': (context) => PredictionPage(),
        '/species_page': (context) => SpeciesPredictionPage(),
      }
    );
  }
}
