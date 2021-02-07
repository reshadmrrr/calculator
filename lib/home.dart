import 'package:androidcalculator/calculate.dart';
import 'package:androidcalculator/constant.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String display = '0';
  String calcString = ' ';
  String resultString = '0';
  bool eqPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text("Calculator", style: titleStyle),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(display, style: firstRow),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(resultString, style: secondRow),
                )
              ]),
            ),
            Row(
              children: <Widget>[
                Expanded(child: buildButton('Clear', Colors.redAccent, 1, 1)),
                SizedBox(width: 1.0),
                Expanded(child: buildButton('Del', Colors.redAccent, 1, 1)),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/', Colors.teal),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('x', Colors.teal),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-', Colors.teal),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('=', Colors.greenAccent),
                    buildButton('+', Colors.teal),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton([String text, Color color, int flag, int flag1]) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 4,
      height: color != Colors.redAccent ? (height * 0.74) / 5 : null,
      child: FlatButton(
        color: color == null ? null : color,
        onPressed: () {
          showDisplay(text);
        },
        padding: EdgeInsets.all(flag == null ? 20.0 : 0.0),
        child: Text(
          text,
          style: flag1 == null ? buttonStyle : clear,
        ),
      ),
    );
  }

  void showDisplay(String button) {
    setState(() {
      if (button == 'Clear') {
        display = "0";
        resultString = '0';
        return;
      }
      if (button == "Del") {
        if (display == '0') return;
        if (display.length == 1) {
          display = "0";
          return;
        }
        display = display.substring(0, display.length - 1);
        return;
      }
      if (button == '.') {
        int c = display.length - 1;
        if (display[c] == '+' ||
            display[c] == '-' ||
            display[c] == 'x' ||
            display[c] == '/') display = display + '0';
      }
      if (display.length == 15) return;
      if (display == '0') display = '';
      if (button == "=") {
        setState(() {
          eqPressed = true;
        });
        Calculate result = Calculate(display);
        result.calc();
        double res = double.parse(result.list[0]);
        resultString =
            res.floor() == res ? res.floor().toString() : res.toString();
        return;
      }
      display = display + button;
    });
  }
}
