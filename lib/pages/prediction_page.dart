import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_your_poison/widgets/dynamic_mushroom.dart';
import '../widgets/widgets.dart';

class PredictionPage extends StatefulWidget {
  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final String prediction = "POISONOUS";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EDE2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2EDE2),
        toolbarHeight: 100,
        title: Container(
          child: StandardText("Back", 25),
        ),
      ),
      body: Expanded(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: StandardText("Your mushroom is likely*", 20),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                color: Colors.red,
                child: Center(
                  child: Text(
                    prediction,
                    style: GoogleFonts.poppins(
                      color:Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: DynamicMushroomDesign(),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  "Want to learn about the most similar real-life species?",
                  style: TextStyle(
                    color:Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: HomeButton("Read More", getSpeciesPrediction),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getSpeciesPrediction(){
    Navigator.pushNamed(context, '/species_page');
  }

  newMushroomDesign(){
    Navigator.pushReplacementNamed(context, '/mushroom_designer');
    // TODO: reset global state variables of mushroom features, or dont lol
  }

}


