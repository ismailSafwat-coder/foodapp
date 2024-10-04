class Food {
  final String name;
  final String description;
  final String imagepath;
  final double price;
  final Foodcategory category;
  final List<Addon> availableAddons;
  final String id;

  Food(this.category, this.availableAddons,
      {required this.name,
      required this.description,
      required this.imagepath,
      required this.price,
      required this.id});
}

enum Foodcategory { burgers, salads, sides, desserts, drinks }

class Addon {
  final String name;
  final double price;

  Addon({required this.name, required this.price});
}
