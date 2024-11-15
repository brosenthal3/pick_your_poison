import 'package:flutter/material.dart';
import 'widgets.dart';


class MushroomDesigner extends StatefulWidget {
  @override
  _MushroomDesignerState createState() => _MushroomDesignerState();
}

class _MushroomDesignerState extends State<MushroomDesigner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cap",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700
                )
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent[200],
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                ),
                onPressed: () {},
                child: const Text(
                  "Next",
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
      body: Center(
        child: Column(
          children: [
            // dynamic mushroom design widget (to be implemented)
            Container(
              child: Column(
                children: [
                  const Image(image: AssetImage("assets/mushroom_concept.png")),
                  Text('Design your mushroom here!'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // mushroom design options (to be implemented)
            Container(
              child: Column(
                children: [
                    MushroomDesignerOptionsColumn(
                      "Shape",
                      [MushroomOptionButton("Option 1", () {}),
                      MushroomOptionButton("Option 2", () {}),
                      MushroomOptionButton("Option 3", () {})]
                    ),
                    const SizedBox(height: 20),
                    MushroomDesignerOptionsColumn(
                      "Surface",
                      [MushroomOptionButton("Option 1", () {}),
                      MushroomOptionButton("Option 2", () {}),
                      MushroomOptionButton("Option 3", () {})]
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}


Widget MushroomDesignerOptionsColumn(String label, List<Widget> options) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
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
