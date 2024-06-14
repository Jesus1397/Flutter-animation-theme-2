import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _theme;

  ThemeProvider(this._theme);

  ThemeData get getTheme => _theme;
  
  set setTheme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }
}