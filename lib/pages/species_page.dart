import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';

class SpeciesPredictionPage extends StatefulWidget {
  const SpeciesPredictionPage({super.key});

  @override
  State<SpeciesPredictionPage> createState() => _SpeciesPredictionPageState();
}

class _SpeciesPredictionPageState extends State<SpeciesPredictionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 150,
        title: Text(
          "Species Prediction",
          style: GoogleFonts.poppins(
            color:Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: StandardText("The most similar species is:", 20),
                  ),
                  Center(
                    child: StandardText("Amanita phalloides", 20),
                  ),
                  const Center(
                    child: Image(image: AssetImage("../assets/deathcap.jpg")),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: StandardText("Amanita phalloides, commonly known as the death cap, is a deadly poisonous basidiomycete fungus, one of many in the genus Amanita. Widely distributed across Europe, A. phalloides forms ectomycorrhizas with various broadleaved trees.", 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}