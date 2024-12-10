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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // cap and gills
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                colorMapper[mushroomFeatures["cap"]
                    ["color"]], // color overlay of cap
                BlendMode.modulate,
              ),
              child: SvgPicture.asset(
                  "../assets/cap/${mushroomFeatures["cap"]["shape"]}.svg",
                  fit: BoxFit.cover,
                  height: 150),
            ),
            // gills
            ColorFiltered(
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
            // cap texture, doesnt wanna work :(
            Positioned(
              bottom: 20,
              child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color.fromARGB(
                        255, 20, 20, 20), // color overlay of cap texture
                    BlendMode.modulate,
                  ),
                  child: SvgPicture.asset(
                      "../assets/cap/texture/${mushroomFeatures["cap"]["surface"]}.svg",
                      fit: BoxFit.cover,
                      width: 150)),
            ),
          ],
        ),

        // stem and ring
        ColorFiltered(
            colorFilter: ColorFilter.mode(
              colorMapper[mushroomFeatures["stem"][
                  "color"]], // color overlay of stem (overlays ring and root too)
              BlendMode.modulate,
            ),
            child: Stack(
              children: [
                SvgPicture.asset(
                    "../assets/stem/${mushroomFeatures["stem"]["roots"]}.svg",
                    fit: BoxFit.cover,
                    height: 150),
                SvgPicture.asset(
                    "../assets/ring/${mushroomFeatures["other"]["ring"]}.svg",
                    fit: BoxFit.cover,
                    height: 50),
              ],
            ))
      ],
    );
  }
}
