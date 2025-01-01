import 'package:dam_datalist/src/app_data.dart';
import 'package:dam_datalist/src/widgets/category_list.dart';
import 'package:dam_datalist/src/widgets/item_list.dart';
import 'package:dam_datalist/src/screen_layouts/shared_appbar.dart';
import 'package:dam_datalist/src/settings/settings_controller.dart';
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
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    return Scaffold(
      appBar: SharedAppBar(
        title: 'Desktop Layout',
        settingsController: widget.settingsController,
      ),
      body: Row(
        children: [
          Container(
            width: 250,
            color: const Color.fromARGB(0, 236, 239, 241),
            child: const Center(
              child: CategoryList(
                categories: ['Category 1', 'Category 2', 'Category 3'],
              ),
            ),
          ),
          if (appData.selectedCategory.isNotEmpty)
            Container(
              width: 250,
              color: const Color.fromARGB(0, 236, 239, 241),
              child: Center(
                child: ItemList(items: appData.getItemList()),
              ),
            ),
        ],
      ),
    );
  }
}
