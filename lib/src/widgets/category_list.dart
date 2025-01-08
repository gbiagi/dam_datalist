import 'package:dam_datalist/src/app_data.dart';
import 'package:dam_datalist/src/screen_layouts/shared_appbar.dart';
import 'package:dam_datalist/src/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categories,
    required this.isMobile,
  });

  final List<String> categories;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'CATEGORIES',
          ),
        ),
        Expanded(
          child: ListView.builder(
            restorationId: 'categoryListView',
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              final category = categories[index];
              return ListTile(
                title: Text(category),
                onTap: () {
                  appData.updateSelectedCategory(category);
                  if (isMobile) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ItemList(
                          isMobile: true,
                          items: appData.itemList,
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
    if (isMobile) {
      return content;
      // Scaffold(
      //   appBar: const SharedAppBar(
      //     title: 'Items',
      //   ),
      //   body: content,
      // );
    } else {
      return content;
    }
  }
}
