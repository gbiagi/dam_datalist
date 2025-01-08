import 'package:dam_datalist/src/app_data.dart';
import 'package:dam_datalist/src/screen_layouts/shared_appbar.dart';
import 'package:dam_datalist/src/settings/settings_controller.dart';
import 'package:dam_datalist/src/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileLayout extends StatefulWidget {
  final SettingsController settingsController;

  const MobileLayout({super.key, required this.settingsController});

  @override
  MobileLayoutState createState() => MobileLayoutState();
}

class MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    return Scaffold(
      appBar: const SharedAppBar(
        title: 'Kingdom Come Deliverance Weapons',
      ),
      body: (CategoryList(
        isMobile: true,
        categories: appData.categories,
      )),
    );
  }
}
