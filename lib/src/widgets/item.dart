// Class for each item of the list
class Item {
  int id;
  String category;
  String name;
  String description;
  String imagePath;
  int weight;
  int price;

  int? minAgilty;
  int? minStrength;
  int? stabDmg;
  int? slashDmg;
  int? bluntDmg;
  int? defense;
  int? charisma;
  int? durability;
  int? power;

  Item({
    required this.id,
    required this.category,
    required this.name,
    required this.weight,
    required this.price,
    required this.description,
    required this.imagePath,
    this.minAgilty,
    this.minStrength,
    this.stabDmg,
    this.slashDmg,
    this.bluntDmg,
    this.defense,
    this.charisma,
    this.durability,
    this.power,
  });
}
