// --- Base class Menu (Encapsulation & Inheritance) ---
class Menu {
  final String name;
  final String image;
  final double price;
  final String description;

  Menu({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  // Polymorphism: getCategory akan di-override
  String getCategory() => 'Menu';
}

// --- Subclass Makanan ---
class Makanan extends Menu {
  Makanan({
    required String name,
    required String image,
    required double price,
    required String description,
  }) : super(name: name, image: image, price: price, description: description);

  @override
  String getCategory() => 'Makanan';
}

// --- Subclass Minuman ---
class Minuman extends Menu {
  Minuman({
    required String name,
    required String image,
    required double price,
    required String description,
  }) : super(name: name, image: image, price: price, description: description);

  @override
  String getCategory() => 'Minuman';
}

// --- Subclass Snack ---
class SnackMenu extends Menu {
  SnackMenu({
    required String name,
    required String image,
    required double price,
    required String description,
  }) : super(name: name, image: image, price: price, description: description);

  @override
  String getCategory() => 'Snack';
}
