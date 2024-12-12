import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

ElevatedButton HomeButton(String text, Function onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 80),
    ),
    onPressed: () => onPressed(),
    child: Text(text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        )),
  );
}

ElevatedButton SkipButton(String text, Function onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    onPressed: () => onPressed(),
    child: Text(text,
        style: GoogleFonts.poppins(
          color: Colors.black54,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        )),
  );
}

Padding MushroomOptionButton(String textInput, VoidCallback onPressed) {
  // transform textinput to lowercase and remove spaces
  final String textInputLower = textInput.toLowerCase().replaceAll(" ", "");
  final String imagePath =
      "../assets/icons/$textInputLower.svg"; // will later be used as image path for icon

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white60,
            fixedSize: Size(75, 75),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.zero,
          ),
          onPressed: onPressed,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Center(
              child: SvgPicture.asset(
                imagePath,
                width: 75,
                fit: BoxFit.cover,
              ),
            ),
          ), // // add image here based on the textInput
        ),
        SizedBox(height: 10),
        Text(
          textInput,
          style: TextStyle(
            color: Color.fromARGB(255, 20, 20, 20),
            fontSize: 17,
          ),
        ),
      ],
    ),
  );
}

Column MushroomOptionButtonColor(
    String textInput, VoidCallback onPressed, String color) {
  Map colorMapper = colorMapperFunc();
  return Column(
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorMapper[color],
          shape: CircleBorder(),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        ),
        onPressed: onPressed,
        child: Container(),
      ),
      SizedBox(height: 10),
      Text(textInput,
          style: TextStyle(
            color: Color.fromARGB(255, 20, 20, 20),
            fontSize: 17,
          )),
    ],
  );
}

Text StandardText(String text, double size) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      color: const Color.fromARGB(255, 20, 20, 20),
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}

//function colorMapper that returns a map of colors
Map<String, Color> colorMapperFunc() {
  return {
    // Color: black (k), brown (n), buff (b), orange (o), grey (g), green (r), pink (p), purple (u), red (e), white (w), yellow (y), blue (l)
    "k": Color.fromARGB(255, 50, 50, 50), // muted black
    "n": Color.fromARGB(255, 115, 84, 64), // muted brown
    "b": Color.fromARGB(255, 254, 246, 158), // muted buff
    "o": Color.fromARGB(255, 238, 144, 56), // muted orange
    "g": Color.fromARGB(255, 168, 168, 168), // muted grey
    "r": Color.fromARGB(255, 94, 135, 67), // muted green
    "p": Color.fromARGB(255, 236, 105, 97), // muted pink
    "u": Color.fromARGB(255, 130, 102, 153), // muted purple
    "e": Color.fromARGB(255, 237, 34, 20), // muted red
    "w": Color.fromARGB(255, 245, 245, 245), // muted white
    "y": Color.fromARGB(255, 235, 211, 87), // muted yellow
    "l": Color.fromARGB(255, 66, 135, 227), // muted blue
  };
}
