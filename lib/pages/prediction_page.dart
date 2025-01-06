import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_your_poison/providers/mushroom_features.dart';
import 'package:pick_your_poison/widgets/dynamic_mushroom.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';

class PredictionPage extends StatefulWidget {
  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'DISCLAIMER',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'This app is for educational and entertainment purposes only and should not be used for real-life mushroom identification or consumption decisions.',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 20, 20, 20),
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  'I Understand',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mushroomFeaturesProvider =
        Provider.of<MushroomFeaturesProvider>(context);

    void restartDesign() {
      Navigator.pop(context);
      mushroomFeaturesProvider.resetMushroom();
    }

    void getSpeciesPrediction() {
      Navigator.pushNamed(context, '/species_page');
    }

    Future<List> getPrediction() async {
      double pred = await mushroomFeaturesProvider.getPrediction();
      Map species = await mushroomFeaturesProvider.getSpecies();
      double speciesPred = species['class'] == 'p' ? 1 : 0;
      double finalPred = pred == 1 || speciesPred == 1 ? 1 : 0;
      if (finalPred == 1) {
        return ["POISONOUS", const Color.fromARGB(255, 214, 27, 14)];
      } else {
        return ["EDIBLE", const Color.fromARGB(255, 0, 128, 0)];
      }
    }

    late Future<List> prediction = getPrediction();

    return Scaffold(
      backgroundColor: const Color(0xFFF2EDE2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2EDE2),
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 231, 72, 38),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              ),
              onPressed: restartDesign,
              child: Text(
                "Start again",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text.rich(
              TextSpan(
                text: "Your mushroom is ",
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 20, 20, 20),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: "likely",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "*",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 5),
          FutureBuilder<List>(
            future: prediction,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: snapshot.data![1],
                  child: Center(
                    child: Text(
                      snapshot.data![0],
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          const Center(
            child: DynamicMushroomDesign(),
          ),
          //const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Want to learn about the most similar real-life species?",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 20, 20, 20),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: HomeButton("Read More", getSpeciesPrediction),
          ),
          SizedBox(height: 20),
          /* Container(
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
          ), */
        ],
      ),
    );
  }
}
