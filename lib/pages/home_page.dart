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
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 150,
        title: Text(
          "Pick Your Poison",
          style: GoogleFonts.poppins(
            color:Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Image(image: AssetImage("../assets/mushroom_concept.png")),
                  ),
                  Center(
                    child: Text(
                      "Design your own mushrooms",
                      style: GoogleFonts.poppins(
                        color:Colors.black,
                        fontSize: 20,
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
                          child: HomeButton("Continue", startDesigner),
                          ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: HomeButton("Tutorial", startTutorial),
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
    Navigator.pushNamed(context, '/tutorial');
  }
  startDesigner(){
    Navigator.pushNamed(context, '/mushroom_designer');
  }
  
  
}

