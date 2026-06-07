import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';
import 'package:b1k5_mobile/features/on_boarding/presentation/widgets/on_boarding_header.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onNext;

  const WelcomeScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          Positioned(
            top: 94,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/features/on_boarding/images/texture_welcome_2.png",
            ),
          ),
          Positioned(
            bottom: 124, // Tarik sedikit ke atas layar agar abstrak
            right: 24, // Tarik sedikit ke kanan layar
            child: Container(
              width: 70, // Ukuran diameter lingkaran
              height: 70,
              decoration: BoxDecoration(
                color: Colors.transparent, // Latar belakang transparan
                shape: BoxShape.circle, // Membuat Container jadi lingkaran
                border: Border.all(
                  color: Color(0xFFF56564),
                  width: 1.0, // Keteba lan outline tipis
                ),
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
                const OnBoardingHeader(
                  title: 'Welcome',
                  description: 'Discover a new experience beyond banking\nwith OCTO!',
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
                        "assets/features/on_boarding/icons/on_boarding_1.png",
                        width: 300
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
                  onPressed: onNext,
                ),
              ],
            ),
          ),
        ],
      );
  }
}
