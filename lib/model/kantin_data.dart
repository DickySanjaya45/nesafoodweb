import 'menu.dart';

class Kantin {
  final String name;
  final String image;
  final List<Menu> menus;

  Kantin({required this.name, required this.image, required this.menus});
}

// Helper untuk membuat menu cepat
List<Menu> _makeMenus(String prefix) {
  final items = <Menu>[];
  for (int i = 1; i <= 15; i++) {
    final kind = i % 3;
    final name = '$prefix Item $i';
    final image = 'assets/placeholder_food.png'; // ganti sesuai asset yang ada
    final price = 8000.0 + (i * 1000);
    final desc = 'Deskripsi singkat $name - enak & segar.';
    if (kind == 0) {
      items.add(
        Makanan(name: name, image: image, price: price, description: desc),
      );
    } else if (kind == 1) {
      items.add(
        Minuman(name: name, image: image, price: price, description: desc),
      );
    } else {
      items.add(
        SnackMenu(name: name, image: image, price: price, description: desc),
      );
    }
  }
  return items;
}

final List<Kantin> kantinList = List.generate(10, (idx) {
  final name = 'Kantin ${String.fromCharCode(65 + idx)}';
  return Kantin(
    name: name,
    image: 'assets/kantin_placeholder.png',
    menus: _makeMenus(name),
  );
});
