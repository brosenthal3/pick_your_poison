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


ElevatedButton MushroomOptionButton(String textInput, Function onPressed) {
    return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white30,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    ),
    onPressed: () {},
    child: Text(
      textInput,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  );
}