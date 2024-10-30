import 'package:flutter/material.dart';

void main() {
  runApp(KalkulatorApp());
}

class KalkulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Sederhana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KalkulatorHomePage(),
    );
  }
}

class KalkulatorHomePage extends StatefulWidget {
  @override
  _KalkulatorHomePageState createState() => _KalkulatorHomePageState();
}

class _KalkulatorHomePageState extends State<KalkulatorHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "*") {
        _output = (num1 * num2).toString();
      } else if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton({String? text, Icon? icon}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
        ),
        child: icon != null
            ? icon
            : Text(
                text!,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
        onPressed: () => buttonPressed(text ?? ''),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Sederhana'),
      ),
      backgroundColor: Colors.black, // Ganti warna latar belakang di sini
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                output,
                style: TextStyle(fontSize: 48.0, color: Colors.white), // Ganti warna teks agar sesuai
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(children: [
              Row(
                children: <Widget>[
                  buildButton(text: "AC"),
                  buildButton(text: "+/-"),
                  buildButton(text: "%"),
                  buildButton(text: "/")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton(text: "7"),
                  buildButton(text: "8"),
                  buildButton(text: "9"),
                  buildButton(text: "X")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton(text: "4"),
                  buildButton(text: "5"),
                  buildButton(text: "6"),
                  buildButton(text: "-")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton(text: "1"),
                  buildButton(text: "2"),
                  buildButton(text: "3"),
                  buildButton(text: "+")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton(icon: Icon(Icons.calculate, color: Colors.white,)),
                  buildButton(text: "0"),
                  buildButton(text: "."),
                  buildButton(text: "=")
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
