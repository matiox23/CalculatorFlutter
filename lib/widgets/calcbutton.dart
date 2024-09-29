import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final int bgColor;
  final Function callBack;
  final String text;
  final double textSize;
  const CalcButton(
      {super.key,
      required this.callBack,
      required this.text,
      this.textSize = 28,
      this.bgColor = 0xfffffffff});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
          width: 65.0,
          height: 65.0,
          child: TextButton(
              onPressed: () {
                callBack(text);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Color(bgColor),
                  foregroundColor: const Color.fromARGB(255, 255, 17,
                      0), //Cuando el user presiona se cambia de color
                  padding: const EdgeInsets.all(16.0),
                  textStyle: TextStyle(fontSize: textSize)),
              child: Text(text,
                  style: GoogleFonts.arima(
                      textStyle: const TextStyle(color: Colors.black))))),
    );
  }
}
