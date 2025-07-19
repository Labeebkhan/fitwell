import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  String _selectedItem = 'Profile';

  String get selectedItem => _selectedItem;

  void selectItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }
}
