import 'package:flutter/material.dart';

List _sport1 = <String>[];

void add_sport(String m) {
  int k = 0;
  if (_sport1.isNotEmpty) {
    for (int i = 0; i < _sport1.length; i++) {
      if (m == _sport1[i]) {
        k = 1;
        break;
      }
    }
    if (k == 1) {
      print('Already There');
    } else {
      _sport1.add(m);
    }
  } else {
    print('String was empty');
    _sport1.add(m);
    print(_sport1);
  }
}

void del_sport(String m) {
  for (int i = 0; i < _sport1.length; i++) {
    if (m == _sport1[i]) {
      _sport1.remove(m);
      print(_sport1);
      break;
    }
  }
}

String conver() {
  String m = _sport1.join('');
  return m;
}

double siz() {
  return _sport1.length.toDouble();
}
