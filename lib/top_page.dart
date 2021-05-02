import 'dart:async';
import 'package:flutter/material.dart';
import 'button.dart';
import 'calculation.dart';

class ResultField extends StatefulWidget {
  @override
  _ResultFieldState createState() => _ResultFieldState();
}

class _ResultFieldState extends State<ResultField> {
  String _figure = '';

  void _UpdateText(String selectButton) {
    setState(() {
      if (selectButton == 'C') {
        _figure = '';
      } else if (selectButton == '=') {
        _figure = '';
        var anser = Calculator.Execute();
        controller.sink.add(anser);
      } else if (selectButton == 'e') {
        _figure = 'Error';
      }
      else {
        _figure += selectButton;
      }
    });
  }

  static final controller = StreamController.broadcast();

  @override
  void initState() {
    controller.stream.listen((event) => _UpdateText(event));
    controller.stream.listen((event) => Calculator.GetKey(event));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            _figure,
            style: TextStyle(fontSize: 60, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

// 数字入力UI
class KeyBord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Container(
          //color: Colors.grey,
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            childAspectRatio: 1.2,
            children: [
              'C', ' ', ' ', '÷',
              '7', '8', '9', '×',
              '4', '5', '6', '-',
              '1', '2', '3', '+',
              '0', '00', '.', '=',
            ].map((key) {
              return GridTile(
                child: Button(key),
            );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class TextUpdate {
  String displayText;
  TextUpdate({this.displayText});

  void Execute() {
    _ResultFieldState.controller.sink.add(this.displayText);
  }
}


