import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6E1312),
      body: Stack(
        children: [
          Positioned(
            top: 4,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/features/on_boarding/images/texture_welcome_1.png",
            ),
          ),
          Positioned(
            top: -2,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/features/on_boarding/images/texture_information_1.png",
            ),
          ),
          Positioned(
            bottom: 340, // Tarik sedikit ke atas layar agar abstrak
            right: 24, // Tarik sedikit ke kanan layar
            child: Container(
              width: 40, // Panjang garis
              height: 1,
              decoration: BoxDecoration(
                color: const Color(
                  0xFFF56564,
                ), // Warna yang sama dengan circle sebelumnya
                // Memberikan sedikit radius di ujung garis agar tidak tajam
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 100, 24, 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'More than just \nbanking',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'From you basic transfer and payment needs, to your investment and leisure needs, we got it all covered!',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Text(
                            'See more',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Icon(
                            LucideIcons.arrowDown,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Image.asset(
                        "assets/features/on_boarding/icons/on_boarding_2.png",
                        width: 300,
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
                CustomButton(
                  text: 'Get Started',
                  backgroundColor: Colors.white,
                  textColor: const Color(0xFF6E1312),
                  borderRadius: 24, // Membuat tombol lebih bulat ujungnya
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InformationScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
