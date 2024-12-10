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

    double capWidth = 250;

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // cap
          Positioned(
            top: 0,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                colorMapper[mushroomFeatures["cap"]["color"]], // color overlay of cap
                BlendMode.modulate,
              ),
              child: SvgPicture.asset(
                  "../assets/cap/${mushroomFeatures["cap"]["shape"]}.svg",
                  fit: BoxFit.cover,
                  width: capWidth),
            ),
          ),
          // cap texture, doesnt wanna work :(
          Positioned(
            top: 30,
            child: Image.asset(
                "../assets/cap/texture/${mushroomFeatures["cap"]["surface"]}.png",
                fit: BoxFit.fill,
                width: capWidth-45),
          ),
          // gills
          Positioned(
            top: 80,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                colorMapper[mushroomFeatures["gills"]
                    ["color"]], // color overlay of gills
                BlendMode.modulate,
              ),
              child: SvgPicture.asset(
                  "../assets/gills/${mushroomFeatures["gills"]["spacing"]}.svg",
                  fit: BoxFit.cover,
                  width: 220),
            ),
          ),
          // stem
          Positioned(
            bottom: 40,
            left: 158,
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
            left: 165,
            bottom: 160,
            child: SvgPicture.asset(
                "../assets/ring/${mushroomFeatures["other"]["ring"]}.svg",
                fit: BoxFit.cover,
                height: 50),
          ),
        ],
      ),
    );
  }
}
