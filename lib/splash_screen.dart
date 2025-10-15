import 'package:flutter/material.dart';
import 'dart:async';
// Import HomeScreen dari file home_screen.dart
import 'login_screen.dart';

// --- Halaman Splash Screen ---

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Memanggil fungsi untuk pindah halaman setelah durasi tertentu
    _navigateToHome();
  }

  // Fungsi untuk mengatur waktu tunggu dan navigasi
  void _navigateToHome() {
    // Menunggu selama 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      // Menggunakan pushReplacement agar pengguna tidak bisa kembali ke Splash Screen
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Latar belakang putih bersih
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Ikon sebagai visualisasi logo makanan
            Icon(
              Icons.restaurant_menu, // Ikon menu makanan
              size: 120.0,
              color: Color(0xFFE65100), // Warna oranye gelap yang menarik
            ),
            SizedBox(height: 30),
            // Nama Aplikasi
            Text(
              'Kantin Cepat',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE65100),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Order Tanpa Antre!',
              style: TextStyle(fontSize: 18.0, color: Colors.black54),
            ),
            SizedBox(height: 60),
            // Indikator loading
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE65100)),
            ),
          ],
        ),
      ),
    );
  }
}
