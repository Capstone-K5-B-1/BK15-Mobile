import 'package:flutter/material.dart';
import 'package:b1k5_mobile/shared/widgets/button/navbar.dart';
import 'package:b1k5_mobile/features/on_boarding/presentation/pages/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "assets/features/splash/images/splash_background.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment
                        .end, // Agar teks cimbs rata kanan terhadap gambar octo
                children: [
                  Image.asset(
                    "assets/features/splash/images/octo_text.png",
                    // Silakan sesuaikan lebar gambar utama
                  ),
                  const SizedBox(height: 8),
                  Image.asset(
                    "assets/features/splash/images/by_cimb_niaga_text.png",
                    width: 120, // Silakan sesuaikan lebar gambar tulisan cimb
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 340,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "All rights reserved, 2011. PT Bank CIMB Niaga Tbk is licensed & supervised by the Financial Services Authority (Otoritas Jasa Keuangan) & Bank Indonesia and is an insured member of Indonesia Deposit Insurance Corporation (IDIC/LPS)",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Version 3.1.84",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
