import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class SpeciesPredictionPage extends StatefulWidget {
  const SpeciesPredictionPage({super.key});

  @override
  State<SpeciesPredictionPage> createState() => _SpeciesPredictionPageState();
}

class _SpeciesPredictionPageState extends State<SpeciesPredictionPage> {

  final String mushroomFamily = "Amanitaceae";
  final String mushroomSpecies = "Amanita phalloides";

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                            child: Image(image: AssetImage("../assets/deathcap.jpg"), height: 330, width: 350, fit: BoxFit.cover)
                          ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 25,
                        child: Text(
                          mushroomFamily,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),),
                      ),
                      Positioned(
                        bottom: 40,
                        left: 25,
                        child: Text(
                          mushroomSpecies,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),),
                      ),
                    ],
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