// necessary import
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/mushroom_features.dart';
import 'package:pick_your_poison/widgets/widgets.dart';

class DynamicMushroomDesign extends StatefulWidget {
  const DynamicMushroomDesign({
    super.key,
  });

  @override
  State<DynamicMushroomDesign> createState() => _DynamicMushroomDesignState();
}

class _DynamicMushroomDesignState extends State<DynamicMushroomDesign> {
  Map colorMapper = colorMapperFunc();

  @override
  Widget build(BuildContext context) {
    final mushroomFeaturesProvider =
        Provider.of<MushroomFeaturesProvider>(context, listen: true);
    final mushroomFeatures = mushroomFeaturesProvider.mushroomFeatures;

    // Shape: bell (b), conical (c), convex (x), flat (f), sunken (s), spherical (p)
    final Map mushroomAttributes = {
      // cap height, gills width, gills top, stem top
      "b": [150, 210.0, 80.0, 83.0],
      "c": [160.0, 175.0, 95.0, 95.0],
      "x": [150.0, 210.0, 80.0, 83.0],
      "f": [115.0, 230.0, 35.0, 40.0],
      "s": [120.0, 280.0, 43.0, 110.0],
      "p": [160.0, 195.0, 90.0, 93.0],
    };

    final Map stemRingAttributes = {
      // stem position, ring position, ring width
      "s": [0, 165, 70],
      "b": [0, 165, 70],
      "c": [0, 165, 70],
      "u": [0, 165, 70], 
      "e": [0, 165, 70],
      "z": [0, 165, 70],
      "r": [0, 165, 70],
    };

    final Map ringAttributes = {
      //- Ring: none (f), cobwebby (c), evenescent (e), flaring (r), grooved (g), large (l), pendant (p), sheathing (s), zone (z), scaly (y), moveable (m)
      // ring width based on ring types
      "c": 75,
      "f": 75,
      "e": 95,
      "r": 150,
      "g": 95,
      "l": 155,
      "p": 120,
      "s": 110,
      "z": 90,
      "y": 80,
      "m": 82,
    }; 
    

    late String gillsSuffix = "";
    if (mushroomFeatures["cap"]["shape"] == "s") {
      gillsSuffix = "_s";
    }

    late String capTexturePathSuffix = "";
    if (mushroomFeatures["cap"]["color"] == "k"){
      capTexturePathSuffix = "/black/${mushroomFeatures["cap"]["surface"]}_${mushroomFeatures["cap"]["shape"]}_black.png";
    } else if (mushroomFeatures["cap"]["color"] == "w" || mushroomFeatures["cap"]["color"] == "b") {
      capTexturePathSuffix = "/white/${mushroomFeatures["cap"]["surface"]}_${mushroomFeatures["cap"]["shape"]}_white.png";
    } else {
      capTexturePathSuffix = "/other/${mushroomFeatures["cap"]["surface"]}_${mushroomFeatures["cap"]["shape"]}.png";
    }

    final String capTexturePath = "../assets/cap/texture$capTexturePathSuffix";

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // cap
          Positioned(
            top: 0,
            child: Stack(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    colorMapper[mushroomFeatures["cap"]["color"]], // color overlay of cap
                    BlendMode.modulate,
                  ),
                  child: SvgPicture.asset(
                      "../assets/cap/${mushroomFeatures["cap"]["shape"]}.svg",
                      fit: BoxFit.cover,
                      height: mushroomAttributes[mushroomFeatures["cap"]["shape"]][0]),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Image.asset(capTexturePath,
                fit: BoxFit.fill,
                height: mushroomAttributes[mushroomFeatures["cap"]["shape"]][0]-5,),
          ),
          // gills
          Positioned(
            top: mushroomAttributes[mushroomFeatures["cap"]["shape"]][2] - (mushroomFeatures["gills"]["spacing"] == "d" ? 3 : 0),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                colorMapper[mushroomFeatures["gills"]
                    ["color"]], // color overlay of gills
                BlendMode.modulate,
              ),
              child: SvgPicture.asset(
                  "../assets/gills/${mushroomFeatures["gills"]["spacing"]}$gillsSuffix.svg", // change to name as
                  fit: BoxFit.cover,
                  width: mushroomAttributes[mushroomFeatures["cap"]["shape"]][1] + (mushroomFeatures["gills"]["spacing"] == "d" ? 6 : 0)),
            ),
          ),
          // stem
          Positioned(
            top: mushroomAttributes[mushroomFeatures["cap"]["shape"]][3],
            //left: 158,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                colorMapper[mushroomFeatures["stem"]["color"]], // color overlay of stem (overlays ring and root too)
                BlendMode.modulate,
              ),
              child: SvgPicture.asset(
                  "../assets/stem/${mushroomFeatures["stem"]["roots"]}.svg",
                  fit: BoxFit.cover,
                  height: 175),
            ),
          ),
          Positioned(
            top: mushroomFeatures["other"]["ring"] == 'c' ? mushroomAttributes[mushroomFeatures["cap"]["shape"]][3]+10
            : mushroomAttributes[mushroomFeatures["cap"]["shape"]][3]+60,
            //left: stemRingAttributes[mushroomFeatures["stem"]["roots"]][1],
            child: mushroomFeatures["other"]["ring"] == 'f' ? Container() : ColorFiltered(
              colorFilter: ColorFilter.mode(
                colorMapper[mushroomFeatures["stem"]["color"]], // color overlay of stem (overlays ring and root too)
                BlendMode.modulate,
              ),
              child: SvgPicture.asset(
                  "../assets/ring/${mushroomFeatures["other"]["ring"]}.svg",
                  fit: BoxFit.cover,
                  width: ringAttributes[mushroomFeatures["other"]["ring"]]),
            ),
          ),
        ],
      ),
    );
  }
}
