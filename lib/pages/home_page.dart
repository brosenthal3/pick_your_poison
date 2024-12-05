import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EDE2),
      appBar: AppBar(
        toolbarHeight: 300,
        title: Column(
          children: [
            const Center(
              child: Image(image: AssetImage("../assets/logo.png")),
            ),
            StandardText("Welcome to the", 25),
            Text(
              "Mushroom Designer",
              style: GoogleFonts.poppins(
                color: const Color(0xFFE74826),
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFF2EDE2),
        centerTitle: true,
        elevation: 0.0
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFFF2EDE2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Image(image: AssetImage("../assets/mushroom_template.png")), // potentially animation of mushroom being designed
                  ),
                  Center(
                    child: Text(
                      "How does it work?",
                      style: GoogleFonts.poppins(
                        color:Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: HomeButton("Tutorial", startTutorial),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: HomeButton("Continue", startDesigner),
                        ),                        
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
  
  startTutorial(){
    Navigator.pushReplacementNamed(context, '/tutorial');
  }
  startDesigner(){
    Navigator.pushReplacementNamed(context, '/mushroom_designer');
  }
  
  
}

