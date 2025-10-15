import 'package:flutter/material.dart';
import '../model/menu.dart';


class DetailMenuScreen extends StatelessWidget {
  final Menu menu;

  const DetailMenuScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.name),
        backgroundColor: const Color(0xFFD35400),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
              child: Image.asset(
                menu.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.fastfood, size: 80),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              menu.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Rp${menu.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 22, color: Colors.orange),
            ),
            const SizedBox(height: 18),
            Text(
              menu.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi order di sini
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD35400),
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Order',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
