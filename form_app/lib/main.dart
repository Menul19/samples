import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: Calculator(), debugShowCheckedModeBanner: false));

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String text = '0';
  double numOne = 0, numTwo = 0;
  String result = '0', finalResult = '0', opr = '', preOpr = '';

  void btnPressed(btnText) {
    if (btnText == 'AC') {
      text = '0'; numOne = 0; numTwo = 0; result = '0'; finalResult = '0'; opr = ''; preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') finalResult = (numOne + numTwo).toString();
      if (preOpr == '-') finalResult = (numOne - numTwo).toString();
      if (preOpr == 'x') finalResult = (numOne * numTwo).toString();
      if (preOpr == '/') finalResult = (numOne / numTwo).toString();
    } else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {
      if (numOne == 0) numOne = double.parse(result);
      else numTwo = double.parse(result);
      if (opr == '+') finalResult = (numOne + numTwo).toString();
      else if (opr == '-') finalResult = (numOne - numTwo).toString();
      else if (opr == 'x') finalResult = (numOne * numTwo).toString();
      else if (opr == '/') finalResult = (numOne / numTwo).toString();
      preOpr = opr; opr = btnText; result = '';
    } else {
      result = result + btnText; finalResult = result;
    }
    setState(() { text = finalResult; });
  }

  Widget btn(String txt, Color clr, Color txtClr) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () => btnPressed(txt),
        child: Text(txt, style: TextStyle(fontSize: 30, color: txtClr)),
        style: ElevatedButton.styleFrom(shape: CircleBorder(), padding: EdgeInsets.all(20), backgroundColor: clr),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Menul Calculator'), backgroundColor: Colors.black),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(children: [Text(text, style: TextStyle(color: Colors.white, fontSize: 80))]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [btn('7', Colors.grey, Colors.black), btn('8', Colors.grey, Colors.black), btn('9', Colors.grey, Colors.black), btn('/', Colors.orange, Colors.white)]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [btn('4', Colors.grey, Colors.black), btn('5', Colors.grey, Colors.black), btn('6', Colors.grey, Colors.black), btn('x', Colors.orange, Colors.white)]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [btn('1', Colors.grey, Colors.black), btn('2', Colors.grey, Colors.black), btn('3', Colors.grey, Colors.black), btn('-', Colors.orange, Colors.white)]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [btn('AC', Colors.red, Colors.white), btn('0', Colors.grey, Colors.black), btn('=', Colors.orange, Colors.white), btn('+', Colors.orange, Colors.white)]),
        ],
      ),
    );
  }
}
