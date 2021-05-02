const c_op = ['+', '-', '×', '÷'];

class Calculator {
  static var _number = new List();
  static var _op = new List(); //演算子

  static String _buffer;
  static double _result;

  static void GetKey(String selectButton) {
    // キー入力を受けて配列に格納
    //四則演算子
    if (c_op.contains(selectButton)) {
      _op.add(selectButton);
      _number.add(double.parse(_buffer));
      _buffer = '';
    } else if (selectButton == 'C') {
      // Cが押されたとき
      _number.clear();
      _op.clear();
      _buffer = '';
    } else if (selectButton == '=') {
      return null;
    } else {
      _buffer += selectButton;
    }
    print(_buffer);

  }

  static String Execute() {
    _number.add(double.parse(_buffer));

    // 入力値が0個だった場合
    if (_number.length == 0) {
      return '0';
    }

    //
    _result = _number[0];

    for (int i = 0; i <_op.length; i++) {
      if (_op[i] == '+') {
        _result += _number[i + 1];
      } else if (_op[i] == '-') {
        _result -= _number[i + 1];
      } else if (_op[i] == '×') {
        _result *= _number[i + 1];
      } else if (_op[i] == '÷') {
        _result /= _number[i + 1];
      } else {
        return 'e';
      }
    }

    _number.clear();
    _op.clear();
    _buffer = '';

    var resultStr = _result.toString().split('.');
    //計算結果を返す.
    return resultStr[1] == '0' ? resultStr[0] : _result.toString();
  }
}