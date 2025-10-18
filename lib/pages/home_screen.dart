import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'headbar_screen.dart';
import '../model/menu.dart';
import '../model/kantin_data.dart';
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
  Kantin? activeKantin;
  final Map<String, int> itemCounts = {};
  static const Color terracotta = Color(0xFFD35400);

  void handleMenuTap(int index) {
    setState(() {
      selectedIndex = index;
      showProfilePanel = false;
      activeKantin = null;
    });
  }

  void handleProfileTap() =>
      setState(() => showProfilePanel = !showProfilePanel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F3),
      appBar: HeadBar(
        title: 'Nesa Food',
        selectedIndex: selectedIndex,
        onMenuTap: handleMenuTap,
        onProfileTap: handleProfileTap,
      ),
      body: Stack(
        children: [
          // Centered content area (keeps layout rapi di layar besar)
          LayoutBuilder(
            builder: (context, constraints) {
              final maxContentWidth = constraints.maxWidth > 1200
                  ? 1100.0
                  : constraints.maxWidth;
              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxContentWidth),
                  child: buildMainContent(),
                ),
              );
            },
          ),
          if (showProfilePanel)
            Positioned(
              top: 100,
              right: 24,
              child: ProfilePanel(
                username: username,
                onClose: handleProfileTap,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildMainContent() {
    if (selectedIndex == 0) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Text(
            'Selamat Datang di Home!',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }

    // Menu tab
    if (activeKantin == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          Row(
            children: [
              IconButton(
                onPressed: () => setState(() => selectedIndex = 0),
                icon: const Icon(Icons.chevron_left),
              ),
              const SizedBox(width: 8),
              Text(
                'Pilih Kantin',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ExpandedGridKantin(),
        ],
      );
    }

    // Kantin menu view
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        Row(
          children: [
            IconButton(
              onPressed: () => setState(() => activeKantin = null),
              icon: const Icon(Icons.chevron_left),
            ),
            const SizedBox(width: 8),
            Text(
              activeKantin!.name,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(child: buildKantinMenu(activeKantin!)),
      ],
    );
  }

  // Grid delegates kept in separate widget for readability
  Widget ExpandedGridKantin() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.05,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: kantinList.length,
        itemBuilder: (context, i) {
          final k = kantinList[i];
          return InkWell(
            onTap: () => setState(() => activeKantin = k),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        k.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.store, size: 36),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                    child: Text(
                      k.name,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildKantinMenu(Kantin kantin) {
    final makanan = kantin.menus
        .where((m) => m.getCategory() == 'Makanan')
        .toList();
    final minuman = kantin.menus
        .where((m) => m.getCategory() == 'Minuman')
        .toList();
    final snack = kantin.menus
        .where((m) => m.getCategory() == 'Snack')
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (makanan.isNotEmpty) sectionList('Makanan', makanan),
          if (minuman.isNotEmpty) sectionList('Minuman', minuman),
          if (snack.isNotEmpty) sectionList('Snack', snack),
          const SizedBox(height: 36),
        ],
      ),
    );
  }

  Widget sectionList(String title, List<Menu> menus) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 260,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 12, right: 12),
            scrollDirection: Axis.horizontal,
            itemCount: menus.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, i) {
              final m = menus[i];
              final count = itemCounts[m.name] ?? 0;
              return Container(
                width: 190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(14),
                      ),
                      child: SizedBox(
                        height: 120,
                        child: Image.asset(
                          m.image,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.grey[200],
                            child: const Icon(Icons.fastfood, size: 36),
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
                            m.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                'Rp${m.price.toStringAsFixed(0)}',
                                style: TextStyle(
                                  color: terracotta,
                                  fontWeight: FontWeight.w700,
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
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: count == 0
                          ? ElevatedButton(
                              onPressed: () =>
                                  setState(() => itemCounts[m.name] = 1),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: terracotta,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Add to Dish',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                IconButton(
                                  onPressed: () => setState(() {
                                    final v = (itemCounts[m.name] ?? 1) - 1;
                                    if (v <= 0)
                                      itemCounts.remove(m.name);
                                    else
                                      itemCounts[m.name] = v;
                                  }),
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: terracotta,
                                  ),
                                ),
                                Text(
                                  '${itemCounts[m.name]}',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => setState(
                                    () => itemCounts[m.name] =
                                        (itemCounts[m.name] ?? 0) + 1,
                                  ),
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.green,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DetailMenuScreen(menu: m),
                                    ),
                                  ),
                                  child: Text(
                                    'Details',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
