import 'package:flutter/material.dart';

//INI BUAT MILIH KATEGORI BREAKFAST DLL
class CategoryModel with ChangeNotifier {
  int _selectedCategory = 0;

  int get selectedCategory => _selectedCategory;

  void setSelectedCategory(int index) {
    _selectedCategory = index;
    notifyListeners(); 
  }
}

