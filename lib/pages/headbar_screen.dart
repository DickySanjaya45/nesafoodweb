import 'package:flutter/material.dart';

class HeadBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int selectedIndex;
  final Function(int) onMenuTap;
  final VoidCallback? onProfileTap;

  const HeadBar({
    super.key,
    required this.title,
    required this.selectedIndex,
    required this.onMenuTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Tambahkan shadow di bawah headbar
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 88,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              // Logo di kiri
              SizedBox(
                height: 56,
                child: Image.asset('assets/logo.png', fit: BoxFit.contain),
              ),
              const SizedBox(width: 40),
              Expanded(child: SizedBox()),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _MenuButton(
                    label: 'Menu',
                    selected: selectedIndex == 1,
                    onTap: () => onMenuTap(1),
                  ),
                  const SizedBox(width: 16),
                  _MenuButton(
                    label: 'About us',
                    selected: selectedIndex == 2,
                    onTap: () => onMenuTap(2),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              SizedBox(
                width: 160,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'search',
                    prefixIcon: Icon(Icons.search, size: 18),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 24),
              // Profile icon yang bisa di-tap
              GestureDetector(
                onTap: onProfileTap,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.person, color: Colors.black, size: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88.0);
}

// Widget tombol menu
class _MenuButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _MenuButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Color(0xFFD35400) : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
