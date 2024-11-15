import 'package:flutter/material.dart';
import 'widgets.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  int currentIndex = 0;
  List tutorials = [Tutorial1(), Tutorial2(), Tutorial3()];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          title: const Text("Tutorial"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
      if (currentIndex < 2) {
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
    return Container(
      child: Text("Tutorial 1"),
    );
  }
}

class Tutorial2 extends StatelessWidget {
  const Tutorial2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Tutorial 2"),
    );
  }
}

class Tutorial3 extends StatelessWidget {
  const Tutorial3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Tutorial 3"),
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
