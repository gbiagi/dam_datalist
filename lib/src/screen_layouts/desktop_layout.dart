import 'package:dam_datalist/src/screen_layouts/shared_appbar.dart';
import 'package:dam_datalist/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';



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
    return Scaffold(
      appBar: SharedAppBar(
        title: 'Desktop Layout',
        settingsController: widget.settingsController,
      ),
      body: const Center(
        child: Text('This is the desktop layout'),  // Changed text
      ),
    );
  }
}