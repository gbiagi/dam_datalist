import 'package:dam_datalist/src/app_data.dart';
import 'package:dam_datalist/src/screen_layouts/shared_appbar.dart';
import 'package:dam_datalist/src/settings/settings_controller.dart';
import 'package:dam_datalist/src/clases/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetailed extends StatelessWidget {
  const ItemDetailed({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    return Scaffold(
      appBar: SharedAppBar(title: item.name),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: appData.getItemImage(item.imagePath).image,
            ),
            Text('Weight: ${item.weight.toString()}'),
            const SizedBox(height: 5),
            Text('Price: ${item.price.toString()}'),
            const SizedBox(height: 5),
            if (item.category != 'Bow')
              Column(
                children: [
                  Text('Min Agility: ${item.minAgilty}'),
                  const SizedBox(height: 5),
                  Text('Min Strength: ${item.minStrength}'),
                  const SizedBox(height: 5),
                  Text('Power: ${item.power}'),
                  const SizedBox(height: 5),
                  Text('Stab Damage: ${item.stabDmg}'),
                  const SizedBox(height: 5),
                  Text('Slash Damage: ${item.slashDmg}'),
                  const SizedBox(height: 5),
                  Text('Blunt Damage: ${item.bluntDmg}'),
                  const SizedBox(height: 5),
                  Text('Defense: ${item.defense}'),
                  const SizedBox(height: 5),
                  Text('Charisma: ${item.charisma}'),
                  const SizedBox(height: 5),
                  Text('Durability: ${item.durability}'),
                  const SizedBox(height: 5),
                ],
              ),
            if (item.category == 'Bow')
              Column(
                children: [
                  Text('Min Agility: ${item.minAgilty}'),
                  const SizedBox(height: 5),
                  Text('Min Strength: ${item.minStrength}'),
                  const SizedBox(height: 5),
                  Text('Power: ${item.power}'),
                  const SizedBox(height: 5),
                ],
              ),
            Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text('Description: ${item.description}'),
            ),
          ],
        ),
      ),
    );
  }
}
