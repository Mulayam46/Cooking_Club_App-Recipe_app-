import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';

class AppState extends ChangeNotifier {
  List<Recipe> _favourites = [];
  bool _isDarkTheme = false;
  Locale _locale = Locale('en', '');

  List<Recipe> get favourites => _favourites;
  bool get isDarkTheme => _isDarkTheme;
  Locale get locale => _locale;

  void toggleFavourite(Recipe recipe) {
    if (_favourites.contains(recipe)) {
      _favourites.remove(recipe);
    } else {
      _favourites.add(recipe);
    }
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  void logout() {}
}
