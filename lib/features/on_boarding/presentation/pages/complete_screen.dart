import 'package:flutter/material.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';
import 'package:b1k5_mobile/features/on_boarding/presentation/widgets/on_boarding_header.dart';
import 'package:b1k5_mobile/features/auth/presentation/pages/login_screen.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/features/on_boarding/images/texture_complete_1.png",
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
                  title: 'Find what you \nneed, login later',
                  description:
                      'Explore now and enjoy a seamless banking experience on the go.',
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/features/on_boarding/icons/on_boarding_3.png",
                      width: 300,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                CustomButton(
                  text: 'Get Started',
                  backgroundColor: Colors.white,
                  textColor: const Color(0xFF6E1312),
                  borderRadius: 24, // Membuat tombol lebih bulat ujungnya
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      );
  }
}
