import 'package:calculadora/widgets/calcbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _history = "";
  String _expresion = "";

  void allClear(String text) {
    setState(() {
      _history = "";
      _expresion = "";
    });
  }

  void clear(String text) {
    setState(() {
      _history = "";
      _expresion = "";
    });
  }

  void evaluate(String text) {
    //Hacer Cálculos
    Parser p = Parser();
    Expression exp = p.parse(_expresion);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expresion;
      _expresion = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numClick(String text) {
    setState(() {
      _expresion += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(title: const Text("Calculadora")),
        backgroundColor: const Color.fromARGB(255, 73, 68, 68),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                // color: Colors.red,
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history,
                      style: GoogleFonts.acme(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 24)),
                    )),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: (Text(_expresion, //Se muestra el texto por pantalla
                      style: GoogleFonts.acme(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 48)))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callBack: clear,
                    text: 'AC',
                    textSize: 20,
                    bgColor: 0xff32CD32,
                  ),
                  CalcButton(
                    callBack: allClear,
                    text: "C",
                    textSize: 20,
                    bgColor: 0xFFE53935,
                  ),
                  CalcButton(callBack: numClick, text: "%", textSize: 20),
                  CalcButton(callBack: numClick, text: "/", textSize: 20)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(callBack: numClick, text: '7', textSize: 20),
                  // bgColor: 0xffE3303A),
                  CalcButton(
                    callBack: numClick,
                    text: "8",
                    textSize: 20,
                  ),
                  // bgColor: 0xffE3303A),
                  CalcButton(callBack: numClick, text: "9", textSize: 20),
                  CalcButton(callBack: numClick, text: "*", textSize: 20)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    callBack: numClick,
                    text: "6",
                    textSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    text: "5",
                    textSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    text: "4",
                    textSize: 20,
                  ),
                  CalcButton(callBack: numClick, text: "-", textSize: 20)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    callBack: numClick,
                    text: "3",
                    textSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    text: "2",
                    textSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    text: "1",
                    textSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    text: "+",
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    callBack: numClick,
                    text: ".",
                    textSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    text: "0",
                    textSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    text: "00",
                    textSize: 20,
                  ),
                  CalcButton(
                    callBack: evaluate,
                    text: "=",
                    textSize: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
