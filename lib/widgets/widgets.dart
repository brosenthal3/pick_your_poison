import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ElevatedButton HomeButton(String text, Function onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
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
