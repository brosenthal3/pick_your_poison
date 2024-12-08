import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../widgets/dynamic_mushroom.dart';
import 'package:provider/provider.dart';
import '../providers/mushroom_features.dart';

class MushroomDesigner extends StatefulWidget {
  @override
  _MushroomDesignerState createState() => _MushroomDesignerState();
}

class _MushroomDesignerState extends State<MushroomDesigner> {
  String currentPage = "cap";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currentPage == "cap" ? Container() : BackButton(onPressed: goBackward), // if currentPage is cap, don't show back button
              StandardText(currentPage, 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent[200],
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                ),
                onPressed: goForward,
                child: Text(
                  currentPage == "other" ? "Predict" : "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              // dynamic mushroom design widget (to be implemented)
              const DynamicMushroomDesign(),
              const SizedBox(height: 30),
              // mushroom design options (to be implemented)
              MushroomDesignerOptions(stage:currentPage),
            ],
          ),
        ),
      ),
    );
  }

  startPrediction(){
    // TODO: perform API call to predict mushroom
    Navigator.pushNamed(context, '/prediction_page');
  }

  goForward() {
    setState(() {
      if (currentPage == "cap") {
        currentPage = "gills";
      } else if (currentPage == "gills") {
        currentPage = "stem";
      } else if (currentPage == "stem") {
        currentPage = "other";
      } else {
        startPrediction();
      }
    });
  }
  goBackward() {
    setState(() {
      if (currentPage == "other") {
        currentPage = "stem";
      } else if (currentPage == "gills") {
        currentPage = "cap";
      } else if (currentPage == "stem") {
        currentPage = "gills";
      }
    });
  }
}

// builds the correct options section based on the current stage
class MushroomDesignerOptions extends StatelessWidget {
  const MushroomDesignerOptions({
    super.key, required this.stage
  });

  final String stage;

  Widget getOptions(String stage){
    if (stage == "cap") {
      return CapOptions();
    } else if (stage == "stem") {
      return StalkOptions();
    } else if (stage == "gills") {
      return GillOptions();
    } else {
      return OtherOptions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return getOptions(stage);
  }
}


class CapOptions extends StatefulWidget {
  const CapOptions({
    super.key,
  });

  @override
  State<CapOptions> createState() => _CapOptionsState();
}

class _CapOptionsState extends State<CapOptions> {
  double capDiameter = 10;

  @override
  Widget build(BuildContext context) {
    final mushroomFeaturesProvider = Provider.of<MushroomFeaturesProvider>(context);

    void updateMushroomFeatures(String feature, String value) {
      mushroomFeaturesProvider.updateFeature("cap", feature, value);
    }

    return ScrollableOptionsContainer(
      child: Column(
        children: [
            MushroomDesignerOptionsColumn(
              label: "Shape",
              options: [MushroomOptionButton("Bell", () {}),
              MushroomOptionButton("Conical", () {}),
              MushroomOptionButton("Convex", () {}),
              MushroomOptionButton("Flat", () {}),
              MushroomOptionButton("Sunken", () {}),
              MushroomOptionButton("Spherical", () {})]
            ),
            /*
            const SizedBox(height: 20),
            MushroomDesignerOptionsColumn(
              label: "Diameter",
              options: [
                Slider(
                  value: capDiameter, 
                  onChanged: (value) {
                    setState(() => capDiameter = value);
                  },
                  min: 5,
                  max: 20
                )
                ]
            ), */
            const SizedBox(height: 20),
            MushroomDesignerOptionsColumn(
              label: "Surface",
              options: [MushroomOptionButton("Fibrous", () {}),
              MushroomOptionButton("Grooves", () {}),
              MushroomOptionButton("Scaley", () {}),
              MushroomOptionButton("Smooth", () {})]
            ),
            const SizedBox(height: 20),
            MushroomDesignerOptionsColumn(
              label: "Color",
              options: [MushroomOptionButton("Black", () {updateMushroomFeatures("color", "k");}),
              MushroomOptionButton("Brown", () {updateMushroomFeatures("color", "n");}),
              MushroomOptionButton("Buff", () {updateMushroomFeatures("color", "b");}),
              MushroomOptionButton("Cinnamon", () {updateMushroomFeatures("color", "o");}),
              MushroomOptionButton("Grey", () {updateMushroomFeatures("color", "g");}),
              MushroomOptionButton("Green", () {updateMushroomFeatures("color", "r");}),
              MushroomOptionButton("Pink", () {updateMushroomFeatures("color", "p");}),
              MushroomOptionButton("Purple", () {updateMushroomFeatures("color", "u");}),
              ]
            ),
          ],
        ),
      );
    }
}


class GillOptions extends StatelessWidget {
  const GillOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mushroomFeaturesProvider = Provider.of<MushroomFeaturesProvider>(context);

    void updateMushroomFeatures(String feature, String value) {
      mushroomFeaturesProvider.updateFeature("gills", feature, value);
    }

    return ScrollableOptionsContainer(
      child: Column(
      children: [
          MushroomDesignerOptionsColumn(
            label: "Spacing",
            options: [MushroomOptionButton("None", () {}),
            MushroomOptionButton("Close", () {}),
            MushroomOptionButton("Distant", () {})]
          ),
          const SizedBox(height: 20),
          MushroomDesignerOptionsColumn(
            label: "Color",
            options: [MushroomOptionButton("Black", () {updateMushroomFeatures("color", "k");}),
              MushroomOptionButton("Brown", () {updateMushroomFeatures("color", "n");}),
              MushroomOptionButton("Buff", () {updateMushroomFeatures("color", "b");}),
              MushroomOptionButton("Cinnamon", () {updateMushroomFeatures("color", "o");}),
              MushroomOptionButton("Grey", () {updateMushroomFeatures("color", "g");}),
              MushroomOptionButton("Green", () {updateMushroomFeatures("color", "r");}),
              MushroomOptionButton("Pink", () {updateMushroomFeatures("color", "p");}),
              MushroomOptionButton("Purple", () {updateMushroomFeatures("color", "u");}),
            ],
          )
        ],
      ),
    );
  }
}

class StalkOptions extends StatelessWidget {
  const StalkOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mushroomFeaturesProvider = Provider.of<MushroomFeaturesProvider>(context);

    void updateMushroomFeatures(String feature, String value) {
      mushroomFeaturesProvider.updateFeature("stem", feature, value);
    }

    return ScrollableOptionsContainer(
      child: Column(
        children: [
            MushroomDesignerOptionsColumn(
              label: "Root",
              //- Root: swollen (s), bulbous (b), club (c), cup (u), equal (e), rhizomorphous (z), rooted (r)
              options: [MushroomOptionButton("Swollen", () {}),
              MushroomOptionButton("Bulbous", () {}),
              MushroomOptionButton("Cup", () {}),
              MushroomOptionButton("Equal", () {}),
              MushroomOptionButton("Rhizomorphous", () {}),
              MushroomOptionButton("Rooted", () {}),
              ]
            ),
            const SizedBox(height: 20),
            MushroomDesignerOptionsColumn(
              label: "Color",
              options: [MushroomOptionButton("Black", () {updateMushroomFeatures("color", "k");}),
              MushroomOptionButton("Brown", () {updateMushroomFeatures("color", "n");}),
              MushroomOptionButton("Buff", () {updateMushroomFeatures("color", "b");}),
              MushroomOptionButton("Cinnamon", () {updateMushroomFeatures("color", "o");}),
              MushroomOptionButton("Grey", () {updateMushroomFeatures("color", "g");}),
              MushroomOptionButton("Green", () {updateMushroomFeatures("color", "r");}),
              MushroomOptionButton("Pink", () {updateMushroomFeatures("color", "p");}),
              MushroomOptionButton("Purple", () {updateMushroomFeatures("color", "u");}),
            ],
            ),
            const SizedBox(height: 20),
            MushroomDesignerOptionsColumn(
              label: "Surface",
              //- Surface: fibrous (i), grooves (g), scaley (y), smooth (s), shiny (h), leathery (l), silky (k), sticky (t), wrinkled (w), fleshy (e)
              options: [MushroomOptionButton("Fibrous", () {}),
              MushroomOptionButton("Grooves", () {}),
              MushroomOptionButton("Scaley", () {}),
              MushroomOptionButton("Smooth", () {}),
              MushroomOptionButton("Shiny", () {}),
              MushroomOptionButton("Leathery", () {}),
              MushroomOptionButton("Silky", () {}),
              MushroomOptionButton("Sticky", () {}),
              MushroomOptionButton("Wrinkled", () {}),
              MushroomOptionButton("Fleshy", () {}),]
            ),
          ],
        ),
      );
  }
}

class OtherOptions extends StatelessWidget {
  const OtherOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollableOptionsContainer(
      child: Column(
        children: [
            MushroomDesignerOptionsColumn(
              label: "Ring type",
              // none (f), cobwebby (c), evenescent (e), flaring (r), grooved (g), 
              // large (l), pendant (p), sheathing (s), zone (z), scaly (y), moveable (m)
              options: [MushroomOptionButton("None", () {}),
              MushroomOptionButton("Cobwebby", () {}),
              MushroomOptionButton("Evenescent", () {})]
            ),
            MushroomDesignerOptionsColumn(
              label: "Ring type",
              // none (f), cobwebby (c), evenescent (e), flaring (r), grooved (g), 
              // large (l), pendant (p), sheathing (s), zone (z), scaly (y), moveable (m)
              options: [MushroomOptionButton("Flaring", () {}),
              MushroomOptionButton("Grooved", () {}),
              MushroomOptionButton("Large", () {})]
            ),
            MushroomDesignerOptionsColumn(
              label: "Ring type",
              // none (f), cobwebby (c), evenescent (e), flaring (r), grooved (g), 
              // large (l), pendant (p), sheathing (s), zone (z), scaly (y), moveable (m)
              options: [MushroomOptionButton("Pendant", () {}),
              MushroomOptionButton("Sheathing", () {}),
              MushroomOptionButton("Zone", () {})]
            ),
            MushroomDesignerOptionsColumn(
              label: "Ring type",
              // none (f), cobwebby (c), evenescent (e), flaring (r), grooved (g), 
              // large (l), pendant (p), sheathing (s), zone (z), scaly (y), moveable (m)
              options: [MushroomOptionButton("Scaly", () {}),
              MushroomOptionButton("Moveable", () {})]
            ),
          ],
        ),
      );
  }
}


class MushroomDesignerOptionsColumn extends StatelessWidget {
  const MushroomDesignerOptionsColumn({
    super.key, required this.label, required this.options
  });

  final String label;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          StandardText(label, 20),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: options 
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      )
    );
  }
}



class ScrollableOptionsContainer extends StatelessWidget {
  final Widget child;

  ScrollableOptionsContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xFFF2EDE2),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: child,
        ),
      ),
    );
  }
}