import 'package:flutter/material.dart';
import 'headbar_screen.dart';
import '../model/menu.dart';
import '../model/kantin_data.dart'; // <-- import baru
import '../profile_panel_screen.dart';
import 'detail_menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool showProfilePanel = false;
  String username = "Dicky Sanjaya";

  // pilihan kantin saat ini (null = pilih kantin)
  Kantin? activeKantin;

  // menyimpan jumlah item yang ditambahkan per menu (key: nama menu)
  final Map<String, int> itemCounts = {};

  void handleMenuTap(int index) {
    setState(() {
      selectedIndex = index;
      showProfilePanel = false;
      // reset activeKantin ketika berpindah tab
      activeKantin = null;
    });
  }

  void handleProfileTap() {
    setState(() {
      showProfilePanel = !showProfilePanel;
    });
  }

  // warna tema terracotta
  static const Color terracotta = Color(0xFFD35400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadBar(
        title: 'Nesa Food',
        selectedIndex: selectedIndex,
        onMenuTap: handleMenuTap,
        onProfileTap: handleProfileTap,
      ),

      // body full-width; navigasi back ditampilkan di atas konten masing-masing view
      body: Stack(
        children: [
          // background area (konten akan berada di sini, tanpa padding luar)
          Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: selectedIndex == 1
                ? (activeKantin == null
                      ? Column(
                          children: [
                            // Back to Home button (when at kantin list)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 8.0,
                                bottom: 4.0,
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.chevron_left),
                                    onPressed: () {
                                      setState(() {
                                        selectedIndex =
                                            0; // kembali ke home welcome
                                        activeKantin = null;
                                      });
                                    },
                                    tooltip: 'Kembali ke Home',
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Pilih Kantin',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: _buildKantinList(context)),
                          ],
                        )
                      : Column(
                          children: [
                            // Back to Kantin List button (when viewing a kantin menu)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 8.0,
                                bottom: 4.0,
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.chevron_left),
                                    onPressed: () {
                                      setState(() {
                                        activeKantin =
                                            null; // kembali ke daftar kantin
                                      });
                                    },
                                    tooltip: 'Kembali ke Pilihan Kantin',
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Kantin: ${activeKantin?.name ?? ''}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: _buildKantinMenu(context, activeKantin!),
                            ),
                          ],
                        ))
                : Center(
                    child: Text(
                      selectedIndex == 0
                          ? 'Selamat Datang di Home!'
                          : 'About Us Page',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),

          // profile panel tetap di area kanan konten
          if (showProfilePanel)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0, right: 8.0),
                child: ProfilePanel(
                  username: username,
                  onClose: handleProfileTap,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Grid daftar kantin — tanpa Card, isi berada langsung di layar (no outer horizontal margin)
  Widget _buildKantinList(BuildContext context) {
    return GridView.builder(
      // hanya top padding; kiri/kanan = 0
      padding: const EdgeInsets.only(top: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: kantinList.length,
      itemBuilder: (context, i) {
        final k = kantinList[i];
        return GestureDetector(
          onTap: () {
            setState(() {
              activeKantin = k; // ketika diklik, tampilkan menu kantin ini
            });
          },
          // container tanpa Card agar isi "menempel" di background
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              // jika ingin tetap efek, gunakan very soft shadow; hapus bila ingin benar-benar rata
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0A000000),
                  blurRadius: 6,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      k.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.store,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    k.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  // Tampilkan daftar menu khusus untuk kantin terpilih — hapus Card, konten berada langsung di home background
  Widget _buildKantinMenu(BuildContext context, Kantin kantin) {
    final menus = kantin.menus;
    final makananList = menus
        .where((m) => m.getCategory() == 'Makanan')
        .toList();
    final minumanList = menus
        .where((m) => m.getCategory() == 'Minuman')
        .toList();
    final snackList = menus.where((m) => m.getCategory() == 'Snack').toList();

    return SingleChildScrollView(
      padding: EdgeInsets.zero, // no outer padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (makananList.isNotEmpty)
            _buildCategorySection(context, 'Makanan', makananList),
          if (minumanList.isNotEmpty) ...[
            const SizedBox(height: 24),
            _buildCategorySection(context, 'Minuman', minumanList),
          ],
          if (snackList.isNotEmpty) ...[
            const SizedBox(height: 24),
            _buildCategorySection(context, 'Snack', snackList),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildCategorySection(
    BuildContext context,
    String title,
    List<Menu> menus,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              left: 16.0,
            ), // start offset so first item not flush to edge
            scrollDirection: Axis.horizontal,
            itemCount: menus.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final menu = menus[index];
              final count = itemCounts[menu.name] ?? 0;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailMenuScreen(menu: menu),
                    ),
                  );
                },
                // simple card-like container but placed directly on background
                child: Container(
                  width: 170,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 8,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // image + badge
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: Image.asset(
                            menu.image,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.fastfood,
                                size: 48,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menu.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  'Rp${menu.price.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    color: terracotta,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.eco,
                                  color: Colors.green.shade700,
                                  size: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Add / counter area
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 6.0,
                        ),
                        child: count == 0
                            ? SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      itemCounts[menu.name] = 1;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: terracotta,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                  ),
                                  child: const Text(
                                    'Add to Dish',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          final v =
                                              (itemCounts[menu.name] ?? 1) - 1;
                                          if (v <= 0) {
                                            itemCounts.remove(menu.name);
                                          } else {
                                            itemCounts[menu.name] = v;
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: terracotta.withOpacity(0.08),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          color: terracotta,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${itemCounts[menu.name]}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          itemCounts[menu.name] =
                                              (itemCounts[menu.name] ?? 0) + 1;
                                        });
                                      },
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: terracotta,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
