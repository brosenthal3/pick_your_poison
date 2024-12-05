// necessary import
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/mushroom_features.dart';

class DynamicMushroomDesign extends StatefulWidget {
  const DynamicMushroomDesign({
    super.key,
  });

  @override
  State<DynamicMushroomDesign> createState() => _DynamicMushroomDesignState();
}

class _DynamicMushroomDesignState extends State<DynamicMushroomDesign> {

  Map colorMapper = {
  // Color: black (k), brown (n), buff (b), cinnamon (o), grey (g), green (r), pink (p), purple (u), red (e), white (w), yellow (y), blue (l)
    "k": Color.fromARGB(255, 0, 0, 0),       // black
    "n": Color.fromARGB(255, 139, 69, 19),   // brown
    "b": Color.fromARGB(255, 218, 165, 32),  // buff
    "o": Color.fromARGB(255, 210, 105, 30),  // cinnamon
    "g": Color.fromARGB(255, 128, 128, 128), // grey
    "r": Color.fromARGB(255, 0, 128, 0),     // green
    "p": Color.fromARGB(255, 255, 192, 203), // pink
    "u": Color.fromARGB(255, 128, 0, 128),   // purple
    "e": Color.fromARGB(255, 255, 0, 0),     // red
    "w": Color.fromARGB(255, 255, 255, 255), // white
    "y": Color.fromARGB(255, 255, 255, 0),   // yellow
    "l": Color.fromARGB(255, 0, 0, 255),     // blue
  };

  @override
  Widget build(BuildContext context) {
    final mushroomFeaturesProvider = Provider.of<MushroomFeaturesProvider>(context);
    final mushroomFeatures = mushroomFeaturesProvider.mushroomFeatures;

    return Column(
      children: [
        // cap and gills
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    colorMapper[mushroomFeatures["cap"]["color"]], // color overlay of cap
                    BlendMode.modulate,
                  ),
                  child: SvgPicture.asset("../assets/cap/${mushroomFeatures["cap"]["shape"]}.svg", fit: BoxFit.cover, height: 150),
              ),
            ),
            // cap texture
            SvgPicture.asset("../assets/cap/texture/${mushroomFeatures["cap"]["surface"]}.svg", fit: BoxFit.cover, height: 150),
            // gills
            Positioned(
              bottom: 10, left:85, right:90,
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    colorMapper[mushroomFeatures["gills"]["color"]], // color overlay of gills
                    BlendMode.modulate,
                  ),
                  child: SvgPicture.asset("../assets/gills/${mushroomFeatures["gills"]["spacing"]}.svg", fit: BoxFit.cover, height: 50),
              ),
            ),
          ],
        ),

        // stem and ring
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            colorMapper[mushroomFeatures["stem"]["color"]], // color overlay of stem (overlays ring and root too)
            BlendMode.modulate,
          ),
          child: Stack(
            children: [
              SvgPicture.asset("../assets/stem/${mushroomFeatures["stem"]["roots"]}.svg", fit: BoxFit.cover, height: 150),
              SvgPicture.asset("../assets/ring/${mushroomFeatures["other"]["ring"]}.svg", fit: BoxFit.cover, height: 50),
            ],
          )
        )
      ],
    );
  }
}
