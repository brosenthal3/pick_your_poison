import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EDE2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2EDE2),
        centerTitle: true,
        elevation: 0.0,
        toolbarHeight: 160,
        title: Stack(
          children: [
            const Center(
              child: SvgPicture(
                SvgAssetLoader("assets/logo.svg"),
                height: 80,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SkipButton("Skip >", startDesigner),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              StandardText("Welcome to the", 24),
              Text(
                "Mushroom Designer",
                style: GoogleFonts.poppins(
                  color: const Color(0xFFE74826),
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFF2EDE2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(40),
                    child: SvgPicture(
                      SvgAssetLoader("assets/mushroom.svg"),
                      height: 200,
                    ),
                  ), // potentially animation of mushroom being designed
                  Center(
                    child: Text(
                      "How does it work?",
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 20, 20, 20),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: HomeButton("Watch Tutorial", startTutorial),
                        ),
                        /* Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: HomeButton("Skip", startDesigner),
                        ), */
                      ],
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

  startTutorial() {
    Navigator.pushReplacementNamed(context, '/tutorial');
  }

  startDesigner() {
    Navigator.pushReplacementNamed(context, '/mushroom_bodymap');
  }
}
