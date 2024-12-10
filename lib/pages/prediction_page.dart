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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "Your mushroom is likely*",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 20, 20, 20),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: const Color.fromARGB(255, 214, 27, 14),
                child: Center(
                  child: Text(
                    prediction,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: DynamicMushroomDesign(),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Want to learn about the most similar real-life species?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 20, 20, 20),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: HomeButton("Read More", getSpeciesPrediction),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text.rich(
                  TextSpan(
                      text: "*DISCLAIMER: ",
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 20, 20, 20),
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                            text:
                                "This app is for educational and entertainment purposes only and should not be used for real-life mushroom identification or consumption decisions.",
                            //textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 20, 20, 20),
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ))
                      ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getSpeciesPrediction() {
    Navigator.pushNamed(context, '/species_page');
  }

  newMushroomDesign() {
    Navigator.pushReplacementNamed(context, '/mushroom_designer');
    // TODO: reset global state variables of mushroom features, or dont lol
  }
}
