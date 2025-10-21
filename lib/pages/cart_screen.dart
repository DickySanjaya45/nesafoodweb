import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/menu.dart';
import '../theme.dart';

class CartScreen extends StatefulWidget {
  final Map<String, int> counts;
  final Map<String, Menu> menuMap;

  const CartScreen({super.key, required this.counts, required this.menuMap});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Map<String, int> localCounts;
  late Map<String, Menu> localMenuMap;

  @override
  void initState() {
    super.initState();
    localCounts = Map<String, int>.from(widget.counts);
    localMenuMap = Map<String, Menu>.from(widget.menuMap);
  }

  void _update(String name, int newCount) {
    setState(() {
      if (newCount <= 0) {
        localCounts.remove(name);
        localMenuMap.remove(name);
      } else {
        localCounts[name] = newCount;
      }
    });
  }

  double get totalPrice {
    double sum = 0;
    localCounts.forEach((name, qty) {
      final menu = localMenuMap[name];
      if (menu != null) sum += menu.price * qty;
    });
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang', style: GoogleFonts.poppins()),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          TextButton(
            onPressed: () {
              // return updated counts to caller
              Navigator.pop(context, localCounts);
            },
            child: Text(
              'Simpan',
              style: GoogleFonts.poppins(color: Colors.black87),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF7F5F3),
      body: localCounts.isEmpty
          ? Center(
              child: Text(
                'Keranjang kosong',
                style: GoogleFonts.poppins(color: Colors.black54),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: localCounts.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, i) {
                        final name = localCounts.keys.elementAt(i);
                        final qty = localCounts[name]!;
                        final menu = localMenuMap[name];
                        return ListTile(
                          leading: SizedBox(
                            width: 60,
                            child: menu != null
                                ? Image.asset(
                                    menu.image,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) =>
                                        Icon(Icons.fastfood),
                                  )
                                : null,
                          ),
                          title: Text(
                            name,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            'Rp${(menu?.price ?? 0).toStringAsFixed(0)} · x $qty',
                            style: GoogleFonts.poppins(fontSize: 13),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => _update(name, qty - 1),
                                icon: const Icon(Icons.remove_circle_outline),
                              ),
                              Text(
                                '$qty',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                onPressed: () => _update(name, qty + 1),
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Total: Rp${totalPrice.toStringAsFixed(0)}',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Simulate checkout -> clear and return empty map
                          setState(() {
                            localCounts.clear();
                            localMenuMap.clear();
                          });
                          Navigator.pop(context, localCounts);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Checkout berhasil (demo)'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: NesaColors.terracotta,
                        ),
                        child: Text('Checkout', style: GoogleFonts.poppins()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
