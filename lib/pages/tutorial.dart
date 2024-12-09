import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        child: StandardText("Design your own mushroom", 20),
      ),
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
          child: StandardText(
              "Find out if it could be \n POISONOUS or EDIBLE", 20),
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
          child: StandardText(
              "Our classification models gives \n you an idea of its safety",
              20),
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
          child: StandardText(
              "See which real-life mushroom species \n your creation resembles",
              20),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Image.asset("..assets/tutorial/tutorial-4.png",
              width: 100), //png doesn't want to cooperate
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
            color: currentIndex == index ? Colors.black : Colors.grey,
          ),
        );
      }),
    );
  }
}
