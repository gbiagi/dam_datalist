import 'package:dam_datalist/src/app_data.dart';
import 'package:dam_datalist/src/clases/item.dart';
import 'package:dam_datalist/src/widgets/item_detailed_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemPreview extends StatelessWidget {
  const ItemPreview({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    return Column(
      children: [
        Text(item.name), const SizedBox(height: 5),
        Image(
          image: appData.getItemImage(item.imagePath).image,
        ),
        const SizedBox(height: 5),

        Text(item.description), const SizedBox(height: 10),

        // When pressed, go to the detailed view
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemDetailed(
                    item: item,
                  ),
                ),
              );
            },
            child: const Text('Expand information')),
      ],
    );
  }
}
