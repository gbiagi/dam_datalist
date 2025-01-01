import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  // Gestion tema
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void updateThemeMode(ThemeMode newMode) {
    if (_themeMode != newMode) {
      _themeMode = newMode;
      notifyListeners();
    }
  }

  // Seleccion de categoria
  var _selectedCategory = "";
  get selectedCategory => _selectedCategory;

  void updateSelectedCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
    }
  }

  // Seleccion de item
  var _selectedItem = "";
  get selectedItem => _selectedItem;

  void updateSelectedItem(String item) {
    if (_selectedItem != item) {
      _selectedItem = item;
      notifyListeners();
    }
  }

  // Lista de items
  List<String> getItemList() {
    List<String> itemList = [];
    if (_selectedCategory.isNotEmpty) {
      if (_selectedCategory == "Category 1") {
        itemList = ["Item 1", "Item 2", "Item 3"];
      } else if (_selectedCategory == "Category 2") {
        itemList = ["Item 4", "Item 5", "Item 6"];
      } else if (_selectedCategory == "Category 3") {
        itemList = ["Item 7", "Item 8", "Item 9"];
      }
    } else {
      itemList = [];
    }
    return itemList;
  }

  // Lista de categorias
  List<String> getCategories() {
    return ["Category 1", "Category 2", "Category 3"];
  }
}
