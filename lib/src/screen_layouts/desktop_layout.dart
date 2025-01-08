import 'package:dam_datalist/src/app_data.dart';
import 'package:dam_datalist/src/widgets/category_list.dart';
import 'package:dam_datalist/src/widgets/item_list.dart';
import 'package:dam_datalist/src/screen_layouts/shared_appbar.dart';
import 'package:dam_datalist/src/settings/settings_controller.dart';
import 'package:dam_datalist/src/widgets/item_preview_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopLayout extends StatefulWidget {
  final SettingsController settingsController;

  const DesktopLayout({
    super.key,
    required this.settingsController,
  });

  @override
  DesktopLayoutState createState() => DesktopLayoutState();
}

class DesktopLayoutState extends State<DesktopLayout> {
  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      AppData appData = Provider.of<AppData>(context, listen: false);
      await appData.getCategories();
      print("Categories loaded");
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Wait 1s
    Future.delayed(const Duration(seconds: 1), () {});
    AppData appData = Provider.of<AppData>(context);
    appData.settingsController = widget.settingsController;
    return Scaffold(
      appBar: const SharedAppBar(
        title: 'Kingdom Come Deliverance Weapons',
      ),
      body: Row(
        children: [
          Container(
            width: 250,
            color: const Color.fromARGB(0, 236, 239, 241),
            child: Center(
              child: CategoryList(
                categories: appData.categories,
                isMobile: false,
              ),
            ),
          ),
          if (appData.selectedCategory.isNotEmpty)
            Container(
              width: 250,
              color: const Color.fromARGB(0, 236, 239, 241),
              child: Center(
                child: ItemList(
                  items: appData.itemList,
                  isMobile: false,
                ),
              ),
            ),
          if (appData.selectedItem != 0)
            Container(
              width: 250,
              color: const Color.fromARGB(0, 236, 239, 241),
              child: Center(
                child: ItemPreview(item: appData.getSelectedItem()),
              ),
            ),
        ],
      ),
    );
  }
}
