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
        toolbarHeight: 100,
        backgroundColor: const Color(0xFFF2EDE2),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              currentPage == "cap"
                  ? Container()
                  : BackButton(
                      onPressed:
                          goBackward), // if currentPage is cap, don't show back button
              StandardText(currentPage, 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent[200],
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                ),
                onPressed: goForward,
                child: Text(
                  currentPage == "other" ? "Predict" : "Next",
                  style: const TextStyle(
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
        color: const Color(0xFFF2EDE2),
        child: Center(
          child: Column(
            children: [
              // dynamic mushroom design widget (to be implemented)
              const SizedBox(height: 10),
              const DynamicMushroomDesign(),
              const SizedBox(height: 10),
              // mushroom design options (to be implemented)
              MushroomDesignerOptions(currentPage),
            ],
          ),
        ),
      ),
    );
  }

  startPrediction() {
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
  final String stage;
  MushroomDesignerOptions(this.stage);

  Widget getOptions(String stage) {
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

  List<Widget> getColorOptions(onClick) {
    // Colors: brown=n, buff=b, gray=g, green=r, pink=p, purple=u, red=e, white=w, yellow=y, blue=l, orange=o,  black=k
    List<Map<String, String>> colorOptions = [
      {"label": "Black", "value": "k"},
      {"label": "Brown", "value": "n"},
      {"label": "Buff", "value": "b"},
      {"label": "Orange", "value": "o"},
      {"label": "Grey", "value": "g"},
      {"label": "Green", "value": "r"},
      {"label": "Pink", "value": "p"},
      {"label": "Purple", "value": "u"},
      {"label": "Red", "value": "e"},
      {"label": "White", "value": "w"},
      {"label": "Yellow", "value": "y"},
      {"label": "Blue", "value": "l"},
    ];
    return colorOptions.map((colorOption) {
      return MushroomOptionButtonColor(colorOption["label"]!, () {
        onClick("color", colorOption["value"]!);
      }, colorOption["value"]!);
    }).toList();
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
  final MushroomDesignerOptions mushroomDesignerOptions =
      MushroomDesignerOptions("cap");
  double capDiameter = 10;
  final colorMapper = colorMapperFunc();

  @override
  Widget build(BuildContext context) {
    final mushroomFeaturesProvider =
        Provider.of<MushroomFeaturesProvider>(context);

    void updateMushroomFeatures(String feature, String value) {
      mushroomFeaturesProvider.updateFeature("cap", feature, value);
    }

    return ScrollableOptionsContainer(
      child: Column(
        children: [
          // Shape: bell (b), conical (C), convex (x), flat (f), sunken (s), spherical (p)
          MushroomDesignerOptionsColumn(label: "Shape", options: [
            MushroomOptionButton("Bell", () => updateMushroomFeatures("shape", "b")),
            MushroomOptionButton("Conical", () => updateMushroomFeatures("shape", "c")),
            MushroomOptionButton("Convex", () => updateMushroomFeatures("shape", "x")),
            MushroomOptionButton("Flat", () => updateMushroomFeatures("shape", "f")),
            MushroomOptionButton("Sunken", () => updateMushroomFeatures("shape", "s")),
            MushroomOptionButton("Spherical", () => updateMushroomFeatures("shape", "p"))
          ]),
          /* for now, no need for diameter
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
          MushroomDesignerOptionsColumn(label: "Surface", options: [
            MushroomOptionButton("Fibrous", () {updateMushroomFeatures("surface", "i");}),
            MushroomOptionButton("Grooves", () {updateMushroomFeatures("surface", "g");}),
            MushroomOptionButton("Scaly", () {updateMushroomFeatures("surface", "y");}),
            MushroomOptionButton("Smooth", () {updateMushroomFeatures("surface", "s");}),
            MushroomOptionButton("Shiny", () {updateMushroomFeatures("surface", "h");}),
            MushroomOptionButton("Leathery", () {updateMushroomFeatures("surface", "l");}),
            MushroomOptionButton("Silky", () {updateMushroomFeatures("surface", "k");}),
            MushroomOptionButton("Sticky", () {updateMushroomFeatures("surface", "t");}),
            MushroomOptionButton("Wrinkled", () {updateMushroomFeatures("surface", "w");}),
            MushroomOptionButton("Fleshy", () {updateMushroomFeatures("surface", "e");}),
          ]),
          const SizedBox(height: 20),
          MushroomDesignerOptionsColumn(
              label: "Color",
              options: mushroomDesignerOptions
                  .getColorOptions(updateMushroomFeatures)),
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
    final mushroomDesignerOptions = MushroomDesignerOptions("cap");
    final mushroomFeaturesProvider =
        Provider.of<MushroomFeaturesProvider>(context);

    void updateMushroomFeatures(String feature, String value) {
      mushroomFeaturesProvider.updateFeature("gills", feature, value);
    }

    return ScrollableOptionsContainer(
      child: Column(
        children: [
          MushroomDesignerOptionsColumn(label: "Spacing", options: [
            MushroomOptionButton("None", () {updateMushroomFeatures("spacing", "f");}),
            MushroomOptionButton("Close", () {updateMushroomFeatures("spacing", "c");}),
            MushroomOptionButton("Distant", () {updateMushroomFeatures("spacing", "d");})
          ]),
          const SizedBox(height: 20),
          MushroomDesignerOptionsColumn(
              label: "Color",
              options: mushroomDesignerOptions
                  .getColorOptions(updateMushroomFeatures))
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
    final MushroomDesignerOptions mushroomDesignerOptions =
        MushroomDesignerOptions("cap");
    final mushroomFeaturesProvider =
        Provider.of<MushroomFeaturesProvider>(context);

    void updateMushroomFeatures(String feature, String value) {
      mushroomFeaturesProvider.updateFeature("stem", feature, value);
    }

    return ScrollableOptionsContainer(
      child: Column(
        children: [
          MushroomDesignerOptionsColumn(
              label: "Root",
              //- Root: swollen (s), bulbous (b), club (c), cup (u), equal (e), rhizomorphous (z), rooted (r)
              options: [
                MushroomOptionButton("Swollen", () {updateMushroomFeatures("roots", "s");}),
                MushroomOptionButton("Bulbous", () {updateMushroomFeatures("roots", "b");}),
                MushroomOptionButton("Club", () {updateMushroomFeatures("roots", "c");}),
                MushroomOptionButton("Cup", () {updateMushroomFeatures("roots", "u");}),
                MushroomOptionButton("Equal", () {updateMushroomFeatures("roots", "e");}),
                MushroomOptionButton("Rhizomorphs", () {updateMushroomFeatures("roots", "z");}),
                MushroomOptionButton("Rooted", () {updateMushroomFeatures("roots", "r");}),
              ]),
          const SizedBox(height: 20),
          MushroomDesignerOptionsColumn(
              label: "Color",
              options: mushroomDesignerOptions
                  .getColorOptions(updateMushroomFeatures)),
          const SizedBox(height: 20),
          MushroomDesignerOptionsColumn(
              label: "Surface",
              //- Surface: fibrous (i), grooves (g), scaley (y), smooth (s), shiny (h), leathery (l), silky (k), sticky (t), wrinkled (w), fleshy (e)
              options: [
                MushroomOptionButton("Fibrous", () {}),
                MushroomOptionButton("Grooves", () {}),
                MushroomOptionButton("Scaly", () {}),
                MushroomOptionButton("Smooth", () {}),
                MushroomOptionButton("Shiny", () {}),
                MushroomOptionButton("Leathery", () {}),
                MushroomOptionButton("Silky", () {}),
                MushroomOptionButton("Sticky", () {}),
                MushroomOptionButton("Wrinkled", () {}),
                MushroomOptionButton("Fleshy", () {}),
              ]),
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
            options: [
              MushroomOptionButton("None", () {}),
              MushroomOptionButton("Cobwebby", () {}),
              MushroomOptionButton("Evenescent", () {}),
              MushroomOptionButton("Flaring", () {}),
              MushroomOptionButton("Grooved", () {}),
              MushroomOptionButton("Large", () {}),
              MushroomOptionButton("Pendant", () {}),
              MushroomOptionButton("Sheathing", () {}),
              MushroomOptionButton("Zone", () {}),
              MushroomOptionButton("Scales", () {}),
              MushroomOptionButton("Moveable", () {}),
            ]),
      ],
    ));
  }
}

class MushroomDesignerOptionsColumn extends StatelessWidget {
  const MushroomDesignerOptionsColumn(
      {super.key, required this.label, required this.options});

  final String label;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
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
              child: Wrap(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 15,
                  children: options),
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}

class ScrollableOptionsContainer extends StatelessWidget {
  final Widget child;

  ScrollableOptionsContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: Colors.black54),),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: child,
        ),
      ),
    );
  }
}
