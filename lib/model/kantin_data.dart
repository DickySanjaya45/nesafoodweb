import 'menu.dart';

class Kantin {
  final String name;
  final String image;
  final List<Menu> menus;

  Kantin({required this.name, required this.image, required this.menus});
}

// Contoh data kantin — tiap kantin punya daftar menu berbeda
final List<Kantin> kantinList = [
  Kantin(
    name: 'Kantin A',
    image: 'assets/kantin_a.png',
    menus: [
      Makanan(
        name: 'Nasi Goreng Spesial',
        image: 'assets/nasgor.png',
        price: 15000,
        description: 'Nasi goreng spesial dengan telur dan ayam.',
      ),
      Minuman(
        name: 'Es Teh Manis',
        image: 'assets/esteh.png',
        price: 5000,
        description: 'Teh manis dingin segar.',
      ),
    ],
  ),
  Kantin(
    name: 'Kantin B',
    image: 'assets/kantin_b.png',
    menus: [
      Makanan(
        name: 'Ayam Geprek Pedas',
        image: 'assets/geprek.png',
        price: 18000,
        description: 'Ayam geprek pedas dengan sambal bawang.',
      ),
      Minuman(
        name: 'Kopi Susu',
        image: 'assets/kopi.png',
        price: 10000,
        description: 'Kopi susu hangat.',
      ),
      SnackMenu(
        name: 'Donat',
        image: 'assets/donat.png',
        price: 6000,
        description: 'Donat lembut dengan gula halus.',
      ),
    ],
  ),
  Kantin(
    name: 'Kantin C',
    image: 'assets/kantin_c.png',
    menus: [
      Makanan(
        name: 'Tasty Vegetable Salad',
        image: 'assets/salad.png',
        price: 17999,
        description: 'Salad sehat lengkap sayur segar.',
      ),
      SnackMenu(
        name: 'Risoles',
        image: 'assets/risoles.png',
        price: 7000,
        description: 'Risoles isi sayur dan daging.',
      ),
    ],
  ),
];
