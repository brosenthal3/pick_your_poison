import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_your_poison/providers/mushroom_features.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class SpeciesPredictionPage extends StatefulWidget {
  const SpeciesPredictionPage({super.key});

  @override
  State<SpeciesPredictionPage> createState() => _SpeciesPredictionPageState();
}

class _SpeciesPredictionPageState extends State<SpeciesPredictionPage> {
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
              'Beta Feature Notice',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'This is a beta feature. Mushroom species predictions might be inaccurate and should be not relied on for mushroom identification or consumption.',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 20, 20, 20),
                fontSize: 16,
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

  String mushroomSpeciesAsset(String mushroomSpecies, String mushroomFamily) {
    String species = mushroomSpecies.toLowerCase().replaceAll(' ', '-');
    String family = mushroomFamily.replaceAll(' ', '_');
    return "assets/Species/$family/$species.jpg";
  }

  Future<List> getDescription(String mushroomSpecies) async {
    // parse JSON file species_descriptions.json to get description

    Future<List<Map<String, dynamic>>> loadJsonData() async {
      String jsonString =
          await rootBundle.loadString('assets/species_descriptions.json');
      List<dynamic> jsonResponse = json.decode(jsonString);
      return jsonResponse.map((item) => item as Map<String, dynamic>).toList();
    }

    Future<List> getDescriptionInner(String mushroomSpecies) async {
      List<Map<String, dynamic>> speciesList = await loadJsonData();
      Map<String, dynamic>? species = speciesList.firstWhere(
        (element) =>
            element['name'].toLowerCase() == mushroomSpecies.toLowerCase(),
        orElse: () => {},
      );
      if (species.isNotEmpty) {
        return [species['description'], species['scientific name']];
      } else {
        return ['Description not found', 'Scientific name not found'];
      }
    }

    return getDescriptionInner(mushroomSpecies);
  }

  @override
  Widget build(BuildContext context) {
    final mushroomProvider =
        Provider.of<MushroomFeaturesProvider>(context, listen: true);

    Future<List> getSpeciesInfo() async {
      final speciesInfo = await mushroomProvider.getSpecies();
      final description = await getDescription(speciesInfo['name']);
      return [speciesInfo, description];
    }

    late Future<List> speciesInfo = getSpeciesInfo();

    return Scaffold(
        backgroundColor: const Color(0xFFF2EDE2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF2EDE2),
          toolbarHeight: 100,
          title: Container(
            child: StandardText("Species Prediction", 23),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List>(
                future: speciesInfo,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    final speciesInfo = snapshot.data!;
                    final speciesData = speciesInfo[0];
                    final description = speciesInfo[1][0];
                    final scientificName = speciesInfo[1][1];
                    final mushroomSpecies = speciesData['name'];
                    final mushroomFamily = speciesData['family'];
                    final mushroomHabitat = speciesData['habitat'].join(', ');
                    final mushroomSeason = speciesData['season'].join(', ');
                    return Container(
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
                                    fontSize: 18,
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
                                    fontSize: 22,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textAlign: TextAlign.left,
                                  'Scientific name',
                                  style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(255, 20, 20, 20),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.right,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  scientificName,
                                  style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(255, 20, 20, 20),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  textAlign: TextAlign.left,
                                  'Habitat',
                                  style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(255, 20, 20, 20),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.right,
                                    mushroomHabitat[0].toUpperCase() + mushroomHabitat.substring(1),
                                  style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(255, 20, 20, 20),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  textAlign: TextAlign.left,
                                  'Season',
                                  style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(255, 20, 20, 20),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.right,
                                  mushroomSeason[0].toUpperCase() + mushroomSeason.substring(1),
                                  style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(255, 20, 20, 20),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: Text(
                                    textAlign: TextAlign.left,
                                    description,
                                    style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 20, 20, 20),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
