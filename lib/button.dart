//ボタンUI
import 'package:calc_app/top_page.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final _key;
  Button(this._key);

  var _textUpdate = new TextUpdate();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: RaisedButton(
        elevation: 10,
        color: Colors.grey,
        child: Center(
          child: Text(
            _key,
            style: TextStyle(fontSize: 30),
          ),
        ),
        shape: const CircleBorder(
            side: BorderSide(
                color: Colors.grey,
                width: 1,
                style: BorderStyle.solid
            )
        ),
        onPressed: () {
          _textUpdate.a = _key;
          _textUpdate.Execute();
        },
      ),
    );
  }
}
