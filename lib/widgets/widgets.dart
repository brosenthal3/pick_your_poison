import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ElevatedButton HomeButton(String text, Function onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    ),
    onPressed: () => onPressed(),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        color:Colors.white,
        fontSize: 20,
      )
    ),
  );
}


Column MushroomOptionButton(String textInput, VoidCallback onPressed) {
    // transform textinput to lowercase and remove spaces
    final String textInputLower = textInput.toLowerCase().replaceAll(" ", "");
    final String imagePath = "../assets/icons/$textInputLower.svg"; // will later be used as image path for icon

    return Column(
      children: [
        ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white30,
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        ),
        onPressed: onPressed,
        child: Container(), // add image here based on the textInput
        ),
        Text(
          textInput,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ],
    );
}


Column MushroomOptionButtonColor(String textInput, VoidCallback onPressed, String color) {
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
        Text(
          textInput,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          )
        ),
      ],
    );
}

Text StandardText(String text, double size) {
    return Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: size,
          fontWeight: FontWeight.w700,
        ),
      );
}

//function colorMapper that returns a map of colors
Map<String, Color> colorMapperFunc() {
  return {
    // Color: black (k), brown (n), buff (b), cinnamon (o), grey (g), green (r), pink (p), purple (u), red (e), white (w), yellow (y), blue (l)
    "k": Color.fromARGB(255, 50, 50, 50),    // muted black
    "n": Color.fromARGB(255, 101, 67, 33),   // muted brown
    "b": Color.fromARGB(255, 205, 183, 158), // muted buff
    "o": Color.fromARGB(255, 176, 101, 50),  // muted cinnamon
    "g": Color.fromARGB(255, 169, 169, 169), // muted grey
    "r": Color.fromARGB(255, 85, 107, 47),   // muted green
    "p": Color.fromARGB(255, 255, 182, 193), // muted pink
    "u": Color.fromARGB(255, 147, 112, 219), // muted purple
    "e": Color.fromARGB(255, 220, 20, 60),   // muted red
    "w": Color.fromARGB(255, 245, 245, 245), // muted white
    "y": Color.fromARGB(255, 255, 255, 224), // muted yellow
    "l": Color.fromARGB(255, 100, 149, 237), // muted blue
  };
}