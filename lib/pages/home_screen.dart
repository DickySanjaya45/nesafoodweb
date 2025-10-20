import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'headbar_screen.dart';
import '../model/menu.dart';
import '../model/kantin_data.dart';
import '../profile_panel_screen.dart';
import 'detail_menu_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  final String? username; // <-- new: terima username dari login

  const HomeScreen({super.key, this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool showProfilePanel = false;
  late String username;
  Kantin? activeKantin;
  // itemCounts used as cart counts keyed by menu.name
  final Map<String, int> itemCounts = {};
  // keep reference to Menu object by name for cart display
  final Map<String, Menu> cartItems = {};
  static const Color terracotta = Color(0xFFD35400);

  // search
  String searchQuery = '';

  // helper cart total qty
  int get cartTotalCount => itemCounts.values.fold(0, (a, b) => a + b);

  void handleMenuTap(int index) {
    setState(() {
      selectedIndex = index;
      showProfilePanel = false;
      activeKantin = null;
      searchQuery = '';
    });
  }

  void handleProfileTap() =>
      setState(() => showProfilePanel = !showProfilePanel);

  void handleSearch(String q) {
    setState(() {
      searchQuery = q.trim();
    });
  }

  void _openCart() async {
    // pass a copy of current counts to cart screen, await updated map
    final result = await Navigator.push<Map<String, int>>(
      context,
      MaterialPageRoute(
        builder: (_) => CartScreen(
          counts: Map<String, int>.from(itemCounts),
          menuMap: Map<String, Menu>.from(cartItems),
        ),
      ),
    );
    if (result != null) {
      setState(() {
        itemCounts
          ..clear()
          ..addAll(result);
        // rebuild cartItems consistent with itemCounts (remove zero)
        cartItems.removeWhere(
          (name, _) => !(itemCounts.containsKey(name) && itemCounts[name]! > 0),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    username = widget.username?.trim().isEmpty ?? true
        ? 'Guest'
        : widget.username!.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F3),
      appBar: HeadBar(
        title: 'Nesa Food',
        selectedIndex: selectedIndex,
        onMenuTap: handleMenuTap,
        onProfileTap: handleProfileTap,
        onSearch: handleSearch,
        searchQuery: searchQuery,
        cartCount: cartTotalCount,
        onCartTap: _openCart,
      ),
      body: Stack(
        children: [
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
                username: username, // <-- uses runtime username
                onClose: handleProfileTap,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildMainContent() {
    // if search active -> show search-only view (hilangkan yang lain)
    if (searchQuery.isNotEmpty) {
      return _buildSearchResults(searchQuery);
    }

    switch (selectedIndex) {
      case 0:
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

      case 1:
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

      case 2:
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Text(
              'About Us Page',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  // UPDATED: search results view (no global menu results when not inside a kantin)
  Widget _buildSearchResults(String q) {
    final qLower = q.toLowerCase();

    // matching kantins (name contains)
    final matchingKantins = kantinList
        .where((k) => k.name.toLowerCase().contains(qLower))
        .toList();

    // If user is inside a kantin, only search that kantin's menus
    if (activeKantin != null) {
      final filtered = activeKantin!.menus
          .where((m) => m.name.toLowerCase().contains(qLower))
          .toList();

      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Hasil pencarian di "${activeKantin!.name}" untuk \"$q\"',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (filtered.isEmpty)
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Tidak ada hasil untuk \"$q\"',
                  style: GoogleFonts.poppins(color: Colors.black54),
                ),
              )
            else
              _buildGridSection('Hasil', filtered),
          ],
        ),
      );
    }

    // If there are kantin name matches -> show only kantin list (hide menu matches)
    if (matchingKantins.isNotEmpty) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Hasil pencarian untuk \"$q\"',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Kantin',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 260,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: matchingKantins.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final k = matchingKantins[i];
                  return InkWell(
                    onTap: () {
                      // open kantin and clear search
                      setState(() {
                        activeKantin = k;
                        searchQuery = '';
                      });
                    },
                    child: Container(
                      width: 260,
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
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              k.name,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
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
        ),
      );
    }

    // No kantin matches and not inside a kantin -> do NOT show global menu results
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        'Tidak ada hasil untuk \"$q\"',
        style: GoogleFonts.poppins(color: Colors.black54),
      ),
    );
  }

  // Grid delegates kept in separate widget for readability
  Widget ExpandedGridKantin() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        // keep kantin card width stable by limiting max cross axis extent
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 360, // desired card width for kantin grid
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
          if (makanan.isNotEmpty) _buildGridSection('Makanan', makanan),
          if (minuman.isNotEmpty) ...[
            const SizedBox(height: 18),
            _buildGridSection('Minuman', minuman),
          ],
          if (snack.isNotEmpty) ...[
            const SizedBox(height: 18),
            _buildGridSection('Snack', snack),
          ],
          const SizedBox(height: 36),
        ],
      ),
    );
  }

  Widget _buildGridSection(String title, List<Menu> menus) {
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
        // Use maxCrossAxisExtent to keep menu card width stable (up to 240 px)
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: menus.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 240, // desired card width for menu grid
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, i) {
            final m = menus[i];
            final count = itemCounts[m.name] ?? 0;
            return Container(
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
                            onPressed: () => setState(() {
                              itemCounts[m.name] = 1;
                              cartItems[m.name] = m;
                            }),
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
                                  if (v <= 0) {
                                    itemCounts.remove(m.name);
                                    cartItems.remove(m.name);
                                  } else
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
      ],
    );
  }
}
