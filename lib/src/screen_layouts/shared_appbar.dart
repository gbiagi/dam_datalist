import 'package:dam_datalist/src/app_data.dart';
import 'package:dam_datalist/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SharedAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SettingsView(
                  controller: appData.settingsController,
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
