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
  String mushroomSpeciesAsset(String mushroomSpecies, String mushroomFamily) {
    String species = mushroomSpecies.toLowerCase().replaceAll(' ', '-');
    String family = mushroomFamily.replaceAll(' ', '_');
    return "../assets/Species/$family/$species.jpg";
  }

  @override
  Widget build(BuildContext context) {
    final mushroomProvider =
        Provider.of<MushroomFeaturesProvider>(context, listen: true);

    Future<Map> getSpeciesInfo() async {
      final speciesInfo = await mushroomProvider.getSpecies();
      return speciesInfo;
    }

    late Future<Map> speciesInfo = getSpeciesInfo();

    return Scaffold(
        backgroundColor: const Color(0xFFF2EDE2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF2EDE2),
          toolbarHeight: 100,
          title: Container(
            child: StandardText("Species Prediction", 25),
          ),
        ),
        body: Column(
          children: [
            FutureBuilder<Map>(
              future: speciesInfo,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  final speciesData = snapshot.data!;
                  final mushroomSpecies = speciesData['name'];
                  final mushroomFamily = speciesData['family'];
                  // final mushroomHabitat = speciesData['habitat'];
                  // final mushroomSeason = speciesData['season'];
                  return Expanded(
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
                                    BlendMode.darken,
                                  ),
                                  child: Image(
                                    image: AssetImage(mushroomSpeciesAsset(
                                        mushroomSpecies, mushroomFamily)),
                                    height: 330,
                                    width: 350,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 25,
                                child: Text(
                                  mushroomFamily,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 50,
                                left: 25,
                                child: Text(
                                  mushroomSpecies,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.left,
                                      'Scientific name',
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 20, 20, 20),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.right,
                                      'Scientific name',
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 20, 20, 20),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.left,
                                      'Habitat',
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 20, 20, 20),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.right,
                                      'Habitat',
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 20, 20, 20),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.left,
                                      'Season',
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 20, 20, 20),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.right,
                                      'Season',
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 20, 20, 20),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: Text(
                                    textAlign: TextAlign.left,
                                    speciesData['description'] ??
                                        'No description available',
                                    style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 20, 20, 20),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ));
  }
}
