import 'package:dam_datalist/src/app_data.dart';
import 'package:dam_datalist/src/clases/item.dart';
import 'package:dam_datalist/src/settings/settings_view.dart';
import 'package:dam_datalist/src/widgets/item_detailed_view.dart';
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
        // Search button
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Search'),
                  content: TextField(
                    decoration:
                        const InputDecoration(hintText: 'Enter weapon name'),
                    onSubmitted: (String value) {
                      Item item = appData.searchItem(value);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ItemDetailed(
                            item: item,
                          ),
                        ),
                      );
                    },
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
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
              },
            );
          },
        ),
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
