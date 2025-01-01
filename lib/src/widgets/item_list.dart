import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      restorationId: 'itemListView',
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        return ListTile(
          title: Text(item),
          onTap: () {
            print('Item $item tapped');
          },
        );
      },
    );
  }
}
