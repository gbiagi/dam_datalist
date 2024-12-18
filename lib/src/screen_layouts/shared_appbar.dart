import 'package:dam_datalist/src/settings/settings_controller.dart';
import 'package:dam_datalist/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final SettingsController settingsController;

  const SharedAppBar({
    super.key,
    required this.title,
    required this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SettingsView(
                  controller: settingsController,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}