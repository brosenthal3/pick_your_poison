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


ElevatedButton MushroomOptionButton(String textInput, VoidCallback onPressed) {
    return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white30,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    ),
    onPressed: onPressed,
    child: Text(
      textInput,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
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
            fontSize: 15,
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
    "k": Color.fromARGB(255, 0, 0, 0),       // black
    "n": Color.fromARGB(255, 139, 69, 19),   // brown
    "b": Color.fromARGB(255, 218, 165, 32),  // buff
    "o": Color.fromARGB(255, 210, 105, 30),  // cinnamon
    "g": Color.fromARGB(255, 128, 128, 128), // grey
    "r": Color.fromARGB(255, 0, 128, 0),     // green
    "p": Color.fromARGB(255, 255, 192, 203), // pink
    "u": Color.fromARGB(255, 128, 0, 128),   // purple
    "e": Color.fromARGB(255, 255, 0, 0),     // red
    "w": Color.fromARGB(255, 255, 255, 255), // white
    "y": Color.fromARGB(255, 255, 255, 0),   // yellow
    "l": Color.fromARGB(255, 0, 0, 255),     // blue
  };
}