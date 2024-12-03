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
              ElevatedButton(onPressed: goBack(), child: Text('Previous'))
              StandardText(currentPage, 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent[200],
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                ),
                onPressed: 
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
    Navigator.pushNamed(context, '/prediction_page');
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
    return Container(
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
    return Container(
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
    return Container(
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
    return Container(
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
        Image(image: AssetImage("assets/mushroom_concept.png")),
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
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700),
          ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options 
        ),
      ],
    ));
  }
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