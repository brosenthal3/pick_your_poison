import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_your_poison/widgets/dynamic_mushroom.dart';
import 'package:pick_your_poison/widgets/widgets.dart';
import 'Package:provider/provider.dart';
import 'package:pick_your_poison/providers/mushroom_features.dart';

class MushroomBodyMapPage extends StatelessWidget {
  const MushroomBodyMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mushroomFeaturesProvider =
        Provider.of<MushroomFeaturesProvider>(context, listen: true);

    bool isPageVisited(String page) {
      return mushroomFeaturesProvider.isPageVisited(page);
    }

    void startPrediction() {
      // TODO: perform API call to predict mushroom
      Navigator.pushNamed(context, '/prediction_page');
    }

    Color editedColor = Color.fromARGB(255, 231, 72, 38);
    //.withOpacity(0.7);
    double pagesVisited = 0;
    // loop through all the visited pages and calculate the progress bar value
    for (var value in ["cap", "gills", "stem", "other"]) {
      if (isPageVisited(value)) {
        pagesVisited += 1;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF2EDE2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2EDE2),
        elevation: 0.0,
        toolbarHeight: 100,
        title: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: StandardText("Design Your Mushroom", 28),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
                textAlign: TextAlign.center,
                "Customise all features in order to get a toxicity prediction",
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 50),
            child: SizedBox(
              height: 350,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const DynamicMushroomDesign(),
                    CustomPaint(
                      size: Size(double.infinity, 350),
                      painter: ArrowPainter(),
                    ),
                    Positioned(
                        top: 0,
                        left: 20,
                        child: SizedBox(
                          width: 120,
                          height: 55,
                          child: BodyMapButton(
                              "Cap",
                              () => Navigator.pushNamed(
                                  context, '/mushroom_designer/cap'),
                              color: isPageVisited("cap") ? editedColor : null),
                        )),
                    Positioned(
                        top: 0,
                        right: 20,
                        child: SizedBox(
                          width: 120,
                          height: 55,
                          child: BodyMapButton(
                              "Gills",
                              () => Navigator.pushNamed(
                                  context, '/mushroom_designer/gills'),
                              color:
                                  isPageVisited("gills") ? editedColor : null),
                        )),
                    Positioned(
                        bottom: 120,
                        right: 20,
                        child: SizedBox(
                          width: 120,
                          height: 55,
                          child: BodyMapButton(
                              "Ring",
                              () => Navigator.pushNamed(
                                  context, '/mushroom_designer/other'),
                              color:
                                  isPageVisited("other") ? editedColor : null),
                        )),
                    Positioned(
                        bottom: 60,
                        left: 20,
                        child: SizedBox(
                          width: 120,
                          height: 55,
                          child: BodyMapButton(
                              "Stem",
                              () => Navigator.pushNamed(
                                  context, '/mushroom_designer/stem'),
                              color:
                                  isPageVisited("stem") ? editedColor : null),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // three quarters page width
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: LinearProgressIndicator(
                    value: pagesVisited / 4,
                    backgroundColor: const Color.fromARGB(255, 80, 69, 66),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 231, 72, 38)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Text("${pagesVisited.toInt()}/4",
                    style: const TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 75, 75, 75))),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: pagesVisited == 4
                  ? Color.fromARGB(255, 231, 72, 38)
                  : Color(0xFF807A72),
              foregroundColor: Colors.white,
              disabledBackgroundColor: Color(0xFF807A72),
              disabledForegroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 150),
              elevation: 0,
            ),
            onPressed: pagesVisited == 4 ? () => startPrediction() : null,
            child: const Text(
              "Predict",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xFF807A72)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Define button dimensions
    final double buttonWidth = 120; // Adjust according to actual button width
    final double buttonHeight = 55; // Adjust according to actual button height

    // Draw L-shaped lines for each button

    // Cap Button
    _drawLShapedLine(
      canvas,
      paint,
      Offset(buttonWidth + 20, buttonHeight / 2),
      Offset(size.width / 2.5, size.height * 0.2),
    );

    // Gills Button
    _drawLShapedLine(
      canvas,
      paint,
      Offset(size.width - 20 - buttonWidth, buttonHeight / 2),
      Offset(size.width / 2 + 50, size.height * 0.4),
    );

    // Ring Button
    _drawLShapedLine(
      canvas,
      paint,
      Offset(size.width - 20 - buttonWidth, size.height / 2 + 30),
      Offset(size.width / 2 + 20, size.height / 2 + 30),
    );

    // Stem Button
    _drawLShapedLine(
      canvas,
      paint,
      Offset(buttonWidth + 20, size.height * 0.8 - 20),
      Offset(size.width / 2 - 10, size.height * 0.8 - 20),
    );
  }

  void _drawLShapedLine(Canvas canvas, Paint paint, Offset start, Offset end) {
    final Path path = Path();
    path.moveTo(start.dx, start.dy);

    // Draw an L-shaped line with two segments:
    // 1. Horizontal segment
    path.lineTo(end.dx, start.dy);
    // 2. Vertical segment
    path.lineTo(end.dx, end.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
