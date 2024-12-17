import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pick_your_poison/widgets/dynamic_mushroom.dart';
import 'package:pick_your_poison/widgets/widgets.dart';
import 'Package:provider/provider.dart';
import 'package:pick_your_poison/providers/mushroom_features.dart';

class MushroomBodyMapPage extends StatelessWidget {
  const MushroomBodyMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mushroomFeaturesProvider =
        Provider.of<MushroomFeaturesProvider>(context, listen: true);
    
    bool isPageVisited(String page) {
      return mushroomFeaturesProvider.isPageVisited(page);
    }

    void startPrediction() {
      // TODO: perform API call to predict mushroom
      Navigator.pushNamed(context, '/prediction_page');
    }

    Color editedColor = const Color.fromARGB(255, 112, 170, 37).withOpacity(0.6);

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
          const SizedBox(height: 20),
          SizedBox(
            height: 400,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  DynamicMushroomDesign(),
                  
                  Positioned(
                    top: 10,
                    left: 40,
                    child: BodyMapButton("Cap", () => Navigator.pushNamed(context, '/mushroom_designer/cap'), color: isPageVisited("cap") ? editedColor : null )
                  ),
              
                  Positioned(
                    top: 80,
                    right: 25,
                    child: BodyMapButton("Gills", () => Navigator.pushNamed(context, '/mushroom_designer/gills'), color: isPageVisited("gills") ? editedColor : null )
                  ),
                  Positioned(
                    top: 160,
                    right: 25,
                    child: BodyMapButton("Ring", () => Navigator.pushNamed(context, '/mushroom_designer/other'), color: isPageVisited("other") ? editedColor : null )
                  ),

                  Positioned(
                    bottom: 40,
                    left: 40,
                    child: BodyMapButton("Stem", () => Navigator.pushNamed(context, '/mushroom_designer/stem'), color: isPageVisited("stem") ? editedColor : null )
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

