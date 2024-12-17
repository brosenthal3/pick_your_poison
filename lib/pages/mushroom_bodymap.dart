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

    Color editedColor = const Color.fromARGB(255, 112, 170, 37).withOpacity(0.7);
    double pagesVisited = 0;
    // loop through all the visited pages and calculate the progress bar value
    for (var value in ["cap", "gills", "stem", "other"]) {
      if (isPageVisited(value)) {
        pagesVisited += 1;
      }
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
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StandardText("Design Your Mushroom", 28),
          SizedBox(
            height: 350,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const DynamicMushroomDesign(),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),  
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // three quarters page width
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: LinearProgressIndicator(
                    value: pagesVisited / 4,
                    backgroundColor: const Color.fromARGB(255, 80, 69, 66),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 231, 72, 38)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Text("${pagesVisited.toInt()}/4", style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 80, 69, 66))),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Colors.black54),
              ),
            ),
            padding: const EdgeInsets.all(30),
            child: StandardText("Select a part of the mushroom to start designing.\n\nPress predict to get your toxicity and species predictions.", 20),
          ),
        ],
      ),
    );
  }
}

