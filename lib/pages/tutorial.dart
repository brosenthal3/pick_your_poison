import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  int currentIndex = 0;
  List tutorials = [Tutorial1(), Tutorial2(), Tutorial3(), Tutorial4()];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF2EDE2),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(image: AssetImage("../assets/logo.png")),
            ),
            tutorials[currentIndex],
            DotsIndicator(currentIndex: currentIndex),
            const SizedBox(height: 30),
            HomeButton("Continue", goThroughIndex)
          ],
        )
      );
  }

  goThroughIndex(){
    setState(() {
      if (currentIndex < 3) {
        currentIndex += 1;
      } else {
        currentIndex = 0;
      }
    });
  }
}

class Tutorial1 extends StatelessWidget {
  const Tutorial1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Image(image: AssetImage("../assets/tutorial_1.0.png")),
        ),
        Container(
          child: Text(
              "Create your own mushroom!",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
        ),
      ],
    );
  }
}

class Tutorial2 extends StatelessWidget {
  const Tutorial2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Find out if it could be POISONOUS or EDIBLE"),
    );
  }
}

class Tutorial3 extends StatelessWidget {
  const Tutorial3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Our classification models gives you an idea of its safety"),
    );
  }
}

class Tutorial4 extends StatelessWidget {
  const Tutorial4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("See which real-life mushroom species your creation resembles"),
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
      children: List.generate(4, (index) {
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
