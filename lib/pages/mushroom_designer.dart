import 'package:flutter/material.dart';
import 'widgets.dart';


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
    Navigator.pushReplacementNamed(context, '/prediction_page');
  }

  goForward() {
    setState(() {
      if (currentPage == "cap") {
        currentPage = "stem";
      } else if (currentPage == "stem") {
        currentPage = "gills";
      } else if (currentPage == "gills") {
        currentPage = "other";
      } else {
        startPrediction();
      }
    });
  }
  goBackward() {
    setState(() {
      if (currentPage == "other") {
        currentPage = "gills";
      } else if (currentPage == "stem") {
        currentPage = "cap";
      } else if (currentPage == "gills") {
        currentPage = "stem";
      }
    });
  }

}


class MushroomDesignerOptions extends StatelessWidget {
  const MushroomDesignerOptions({
    super.key, required this.stage
  });

  final String stage;


  @override
  Widget build(BuildContext context) {
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
}

class CapOptions extends StatefulWidget {
  const CapOptions({
    super.key,
  });

  @override
  State<CapOptions> createState() => _CapOptionsState();
}

class _CapOptionsState extends State<CapOptions> {
  double capDiameter = 50;

  @override
  Widget build(BuildContext context) {
    return ScrollableOptionsContainer(
      child: Column(
        children: [
            MushroomDesignerOptionsColumn(
              label: "Shape",
              options: [MushroomOptionButton("Option 1", () {}),
              MushroomOptionButton("Option 2", () {}),
              MushroomOptionButton("Option 3", () {})]
            ),
            const SizedBox(height: 20),
            MushroomDesignerOptionsColumn(
              label: "Diameter",
              options: [
                Slider(
                  value: capDiameter, 
                  onChanged: (value) {
                    setState(() => capDiameter = value);
                  },
                  min: 0,
                  max: 100
                )
                ]
            ),
            const SizedBox(height: 20),
            MushroomDesignerOptionsColumn(
              label: "Surface",
              options: [MushroomOptionButton("Option 1", () {}),
              MushroomOptionButton("Option 2", () {}),
              MushroomOptionButton("Option 3", () {})]
            ),
            const SizedBox(height: 20),
            MushroomDesignerOptionsColumn(
              label: "Color",
              options: [MushroomOptionButton("Option 1", () {}),
              MushroomOptionButton("Option 2", () {}),
              MushroomOptionButton("Option 3", () {})]
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
    return ScrollableOptionsContainer(
      child: Column(
      children: [
          MushroomDesignerOptionsColumn(
            label: "Spacing",
            options: [MushroomOptionButton("Option 1", () {}),
            MushroomOptionButton("Option 2", () {}),
            MushroomOptionButton("Option 3", () {})]
          ),
          const SizedBox(height: 20),
          MushroomDesignerOptionsColumn(
            label: "Size",
            options: [MushroomOptionButton("Option 1", () {})]
          ),
          const SizedBox(height: 20),
          MushroomDesignerOptionsColumn(
            label: "Color",
            options: [MushroomOptionButton("Option 1", () {}),
            MushroomOptionButton("Option 2", () {}),
            MushroomOptionButton("Option 3", () {})]
          ),
          MushroomDesignerOptionsColumn(
            label: "Color",
            options: [MushroomOptionButton("Option 1", () {}),
            MushroomOptionButton("Option 2", () {}),
            MushroomOptionButton("Option 3", () {})]
          ),
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
    return ScrollableOptionsContainer(
      child: Column(
        children: [
            MushroomDesignerOptionsColumn(
              label: "Surface",
              options: [MushroomOptionButton("Option 1", () {}),
              MushroomOptionButton("Option 2", () {}),
              MushroomOptionButton("Option 3", () {})]
            ),
            const SizedBox(height: 20),
            MushroomDesignerOptionsColumn(
              label: "Color",
              options: [MushroomOptionButton("Option 1", () {})]
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
              options: [MushroomOptionButton("Option 1", () {}),
              MushroomOptionButton("Option 2", () {}),
              MushroomOptionButton("Option 3", () {})]
            ),
            const SizedBox(height: 20),
            MushroomDesignerOptionsColumn(
              label: "Roots type",
              options: [MushroomOptionButton("Option 1", () {}), MushroomOptionButton("Option 2", () {}), MushroomOptionButton("Option 3", () {})]
            ),
          ],
        ),
      );
  }
}

class DynamicMushroomDesign extends StatelessWidget {
  const DynamicMushroomDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(image: AssetImage("assets/mushroom_template.png"), height: 200),
        Text('Design your mushroom here!'),
      ],
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
      children: [
        SizedBox(height: 20),
        StandardText(label, 20),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options 
        ),
      ],
    ));
  }
}

class ScrollableOptionsContainer extends StatefulWidget {
  Widget child;

  ScrollableOptionsContainer({super.key, required this.child});

  @override
  State<ScrollableOptionsContainer> createState() => _ScrollableOptionsContainerState();
}

class _ScrollableOptionsContainerState extends State<ScrollableOptionsContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xFFF2EDE2),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: widget.child,
        ),
      ),
    );
  }
}