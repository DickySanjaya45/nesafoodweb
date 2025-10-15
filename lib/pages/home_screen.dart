import 'package:flutter/material.dart';
import 'headbar_screen.dart';
import '../model/menu_data.dart';
import '../model/menu.dart';
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
  String username = "Dicky Sanjaya"; // Ganti dengan username login dinamis

  void handleMenuTap(int index) {
    setState(() {
      selectedIndex = index;
      showProfilePanel = false;
    });
  }

  void handleProfileTap() {
    setState(() {
      showProfilePanel = !showProfilePanel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadBar(
        title: 'Nesa Food',
        selectedIndex: selectedIndex,
        onMenuTap: handleMenuTap,
        onProfileTap: handleProfileTap,
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFF9F2F8),
            width: double.infinity,
            child: selectedIndex == 1
                ? _buildMenuPage(context)
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
          if (showProfilePanel)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 24, right: 32),
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

  Widget _buildMenuPage(BuildContext context) {
    final makananList = allMenus
        .where((m) => m.getCategory() == 'Makanan')
        .toList();
    final minumanList = allMenus
        .where((m) => m.getCategory() == 'Minuman')
        .toList();
    final snackList = allMenus
        .where((m) => m.getCategory() == 'Snack')
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategorySection(context, 'Makanan', makananList),
          const SizedBox(height: 24),
          _buildCategorySection(context, 'Minuman', minumanList),
          const SizedBox(height: 24),
          _buildCategorySection(context, 'Snack', snackList),
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
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: menus.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final menu = menus[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailMenuScreen(menu: menu),
                    ),
                  );
                },
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Image.asset(
                          menu.image,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.fastfood, size: 48),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        menu.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Rp${menu.price.toStringAsFixed(0)}',
                        style: const TextStyle(color: Colors.orange),
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
