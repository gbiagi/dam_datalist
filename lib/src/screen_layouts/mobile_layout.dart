import 'package:dam_datalist/src/screen_layouts/shared_appbar.dart';
import 'package:dam_datalist/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatefulWidget {
  final SettingsController settingsController;

  const MobileLayout({super.key, required this.settingsController});

  @override
  MobileLayoutState createState() => MobileLayoutState();
}

class MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: 'Mobile Layout',
        settingsController: widget.settingsController,
      ),
      body: const Center(
        child: Text('This is the mobile layout'),
      ),
    );
  }
}
