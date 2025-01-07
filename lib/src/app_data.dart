import 'dart:convert';
import 'package:dam_datalist/src/settings/settings_controller.dart';
import 'package:dam_datalist/src/clases/item.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  final String url = 'http://localhost:3000';

  List<String> categories = [];
  List<Item> itemList = [];

  // Gestion tema
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void updateThemeMode(ThemeMode newMode) {
    if (_themeMode != newMode) {
      _themeMode = newMode;
      notifyListeners();
    }
  }

  late SettingsController settingsController;

  // Seleccion de categoria
  var _selectedCategory = "";
  get selectedCategory => _selectedCategory;

  Future<void> updateSelectedCategory(String category) async {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      _selectedItem = 0;
      await getCatItems(_selectedCategory);
    }
  }

  // Seleccion de item
  int _selectedItem = 0;
  get selectedItem => _selectedItem;

  void updateSelectedItem(int itemId) {
    if (_selectedItem != itemId) {
      _selectedItem = itemId;
      notifyListeners();
    }
  }

  Item getSelectedItem() {
    return itemList.firstWhere((item) => item.id == _selectedItem);
  }

  // Lista de items
  Future<void> getCatItems(String category) async {
    print("Updating items from category: $category");

    var response = await http.post(
      Uri.parse('$url/cat_items'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'category': category,
      }), // Encode the body as JSON
    );

    if (response.statusCode == 200) {
      itemList.clear();
      Map<String, dynamic> data = jsonDecode(response.body);
      if (_selectedCategory == "Bow") {
        for (var item in data['items']) {
          itemList.add(Item(
            id: item['id'],
            category: item['category'],
            name: item['name'],
            minAgilty: item['minAgilty'],
            minStrength: item['minStrength'],
            power: item['power'],
            weight: item['weight'],
            price: item['price'],
            description: item['description'],
            imagePath: item['imagePath'],
          ));
        }
        notifyListeners();
      } else {
        for (var item in data['items']) {
          itemList.add(Item(
            id: item['id'],
            category: item['category'],
            name: item['name'],
            weight: 5,
            price: item['price'],
            description: item['description'],
            imagePath: item['imagePath'],
            minAgilty: item['minAgilty'],
            minStrength: item['minStrength'],
            stabDmg: item['stabDmg'],
            slashDmg: item['slashDmg'],
            bluntDmg: item['bluntDmg'],
            defense: item['defense'],
            charisma: item['charisma'],
            durability: item['durability'],
          ));
        }
        notifyListeners();
      }
    } else {
      throw Exception('Failed to load items');
    }
  }

  // Lista de categorias
  Future<void> getCategories() async {
    print("Updating category");
    if (categories.isNotEmpty) {
      categories.clear();
    }
    var response = await http.get(Uri.parse('$url/categories'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var category in data) {
        categories.add(category);
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Conseguir imagen item
  Image getItemImage(String imagePath) {
    return Image.network(
      '$url$imagePath',
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        }
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}
