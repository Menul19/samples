import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: SimpleCalculator(), debugShowCheckedModeBanner: false));

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String display = '0';

  void onPressed(String text) {
    setState(() {
      if (text == 'AC') display = '0';
      else display = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(display, style: TextStyle(fontSize: 50)),
            ElevatedButton(onPressed: () => onPressed('AC'), child: Text('Clear')),
          ],
        ),
      ),
    );
  }
}
