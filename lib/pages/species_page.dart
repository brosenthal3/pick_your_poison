import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_your_poison/providers/mushroom_features.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';

class SpeciesPredictionPage extends StatefulWidget {
  const SpeciesPredictionPage({super.key});

  @override
  State<SpeciesPredictionPage> createState() => _SpeciesPredictionPageState();
}

class _SpeciesPredictionPageState extends State<SpeciesPredictionPage> {
  late String mushroomFamily = '';
  late String mushroomSpecies = '';

  String get mushroomSpeciesAsset {
    return mushroomSpecies.toLowerCase().replaceAll(' ', '-');
  }
  String get mushroomFamilyAsset {
    return mushroomFamily.replaceAll(' ', '_');
  }

  @override
  void initState() {
    asynchInitState();
  }

  Future<void> asynchInitState() async {
    final mushroomProvider = Provider.of<MushroomFeaturesProvider>(context, listen: true);
    final speciesInfo = await mushroomProvider.getSpecies();
    setState(() {
      mushroomFamily = speciesInfo['family'] ?? '';
      mushroomSpecies = speciesInfo['species'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EDE2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2EDE2),
        toolbarHeight: 100,
        title: Container(
          child: StandardText("Species Prediction", 25),
        ),
      ),
      body: (mushroomFamily.isEmpty || mushroomSpecies.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.darken),
                            child: Image(
                                image: AssetImage("../assets/Species/$mushroomFamilyAsset/$mushroomSpeciesAsset.jpg"),
                                height: 330,
                                width: 350,
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 25,
                        child: Text(mushroomFamily,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 25,
                        child: Text(mushroomSpecies,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.left,
                        "Amanita phalloides, commonly known as the death cap, is a deadly poisonous basidiomycete fungus, one of many in the genus Amanita. Widely distributed across Europe, A. phalloides forms ectomycorrhizas with various broadleaved trees.",
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 20, 20, 20),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
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
