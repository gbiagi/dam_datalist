import 'package:dam_datalist/src/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    return ListView.builder(
      restorationId: 'categoryListView',
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final category = categories[index];

        return ListTile(
          title: Text(category),
          onTap: () {
            appData.updateSelectedCategory(category);
          },
        );
      },
    );
  }
}
