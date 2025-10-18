import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    const terracotta = Color(0xFFD35400);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 88,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              SizedBox(
                height: 56,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const SizedBox(),
                ),
              ),
              const SizedBox(width: 24),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              _MenuButton(
                label: 'Home',
                selected: selectedIndex == 0,
                onTap: () => onMenuTap(0),
              ),
              const SizedBox(width: 8),
              _MenuButton(
                label: 'Menu',
                selected: selectedIndex == 1,
                onTap: () => onMenuTap(1),
              ),
              const SizedBox(width: 8),
              _MenuButton(
                label: 'About',
                selected: selectedIndex == 2,
                onTap: () => onMenuTap(2),
              ),
              const SizedBox(width: 18),
              SizedBox(
                width: 220,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search menu or kantin',
                    prefixIcon: const Icon(Icons.search, size: 20),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: onProfileTap,
                child: const CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Icon(Icons.person, color: Colors.black87),
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFD35400) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
