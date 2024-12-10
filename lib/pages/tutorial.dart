import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';

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
        appBar: AppBar(
          backgroundColor: const Color(0xFFF2EDE2),
          centerTitle: true,
          elevation: 0.0,
          toolbarHeight: 200,
          title: const Center(
            child: SvgPicture(
              SvgAssetLoader("../assets/logo.svg"),
              height: 100,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFF2EDE2),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            tutorials[currentIndex],
            DotsIndicator(currentIndex: currentIndex),
            const SizedBox(height: 30),
            HomeButton("Continue", goThroughIndex)
          ],
        ));
  }

  goThroughIndex() {
    setState(() {
      if (currentIndex < 3) {
        currentIndex += 1;
      } else {
        print('Go to mushroom designer');
        Navigator.pushReplacementNamed(context, '/mushroom_designer');
      }
    });
  }
}

class Tutorial1 extends StatelessWidget {
  const Tutorial1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            textAlign: TextAlign.center,
            "Design your own mushroom",
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 20, 20, 20),
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          )),
      Padding(
        padding: const EdgeInsets.all(30),
        child: SvgPicture(
          SvgAssetLoader("../assets/tutorial/tutorial-1.svg"),
          height: 250,
        ),
      ),
    ]);
  }
}

class Tutorial2 extends StatelessWidget {
  const Tutorial2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
                text: "Find out if it could be \n",
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 20, 20, 20),
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: "POISONOUS ",
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 237, 34, 20),
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "or ",
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 20, 20, 20),
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "EDIBLE",
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 94, 135, 67),
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: SvgPicture(
            SvgAssetLoader("../assets/tutorial/tutorial-2.svg"),
            height: 250,
          ),
        ),
      ],
    );
  }
}

class Tutorial3 extends StatelessWidget {
  const Tutorial3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
              textAlign: TextAlign.center,
              "Our classification models gives you an idea of its safety",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 20, 20, 20),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: SvgPicture(
            SvgAssetLoader("../assets/tutorial/tutorial-3.svg"),
            height: 250,
          ),
        ),
      ],
    );
  }
}

class Tutorial4 extends StatelessWidget {
  const Tutorial4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
              textAlign: TextAlign.center,
              "See which real-life mushroom \n your creation resembles",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 20, 20, 20),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Image.asset("../assets/tutorial/tutorial-4.png", fit: BoxFit.contain, height: 250), //png doesn't want to cooperate
        ),
      ],
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
            color: currentIndex == index
                ? const Color.fromARGB(255, 20, 20, 20)
                : Colors.grey,
          ),
        );
      }),
    );
  }
}
