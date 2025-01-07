import 'package:dam_datalist/src/app_data.dart';
import 'package:dam_datalist/src/clases/item.dart';
import 'package:dam_datalist/src/screen_layouts/shared_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.items,
    required this.isMobile,
  });

  final List<Item> items;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('ITEMS'),
        ),
        Expanded(
          child: ListView.builder(
            restorationId: 'itemListView',
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return ListTile(
                title: Text(item.name),
                onTap: () {
                  appData.updateSelectedItem(item.id);
                },
              );
            },
          ),
        ),
      ],
    );

    if (isMobile) {
      return Scaffold(
        appBar: const SharedAppBar(
          title: 'Items',
        ),
        body: content,
      );
    } else {
      return content;
    }
  }
}
