import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

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
                  DotsIndicator(currentIndex: currentIndex),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 20),
                              ),
                              onPressed: (){
                                setState(() {
                                  if (currentIndex < 2) {
                                    currentIndex += 1;
                                  } else {
                                    currentIndex = 0;
                                  }
                                });
                              },
                              child: Text(
                                "Continue",
                                style: GoogleFonts.poppins(
                                  color:Colors.white,
                                  fontSize: 20,
                                )
                              ),
                            ),
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
}


class DotsIndicator extends StatelessWidget {
  final int currentIndex;

  DotsIndicator({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: 12.0,
          height: 12.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? Colors.black : Colors.grey,
          ),
        );
      }),
    );
  }
}