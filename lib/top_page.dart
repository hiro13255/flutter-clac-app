import 'package:flutter/material.dart';

import 'button.dart';

class ResultField extends StatefulWidget {
  @override
  _ResultFieldState createState() => _ResultFieldState();
}

class _ResultFieldState extends State<ResultField> {
  String _figure = '1+1';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            _figure,
            style: TextStyle(fontSize: 60, color: Colors.white),
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
            childAspectRatio:1.2,
            //padding: const EdgeInsets.all(4),
            children: [
              'C', 'a', '%', '÷',
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



