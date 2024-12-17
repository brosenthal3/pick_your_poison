import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pick_your_poison/widgets/dynamic_mushroom.dart';
import 'package:pick_your_poison/widgets/widgets.dart';

class MushroomBodyMapPage extends StatelessWidget {
  const MushroomBodyMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    startPrediction() {
      // TODO: perform API call to predict mushroom
      Navigator.pushNamed(context, '/prediction_page');
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF2EDE2),
      appBar: AppBar(        
        backgroundColor: const Color(0xFFF2EDE2),
        elevation: 0.0,
        toolbarHeight: 100,
        title: Container(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 231, 72, 38),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              ),
              onPressed: () => startPrediction(),
              child: const Text(
                "Predict",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ]
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 400,
              padding: EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  DynamicMushroomDesign(),
                  
                  Positioned(
                    left: 40,
                    top: 30,
                    child: BodyMapButton("Cap", () => Navigator.pushNamed(context, '/mushroom_designer'))
                  ),
              
                  Positioned(
                    top: 80,
                    right: 5,
                    child: BodyMapButton("Gills", () => Navigator.pushNamed(context, '/mushroom_designer'))
                  ),
                  Positioned(
                    top: 160,
                    child: BodyMapButton("Ring", () => Navigator.pushNamed(context, '/mushroom_designer'))
                  ),

                  Positioned(
                    top: 260,
                    left: 60,
                    child: BodyMapButton("Stem", () => Navigator.pushNamed(context, '/mushroom_designer'))
                  ),
                  
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: StandardText("Select a part of the mushroom to start designing.\n\nPress predict to get your toxicity and species predictions.", 20),
          ),
        ],
      ),
    );
  }
}

