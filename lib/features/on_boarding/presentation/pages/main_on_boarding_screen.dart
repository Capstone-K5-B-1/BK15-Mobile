import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/on_boarding/presentation/pages/welcome_screen.dart';
import 'package:b1k5_mobile/features/on_boarding/presentation/pages/information_screen.dart';
import 'package:b1k5_mobile/features/on_boarding/presentation/pages/complete_screen.dart';

class MainOnBoardingScreen extends StatefulWidget {
  const MainOnBoardingScreen({super.key});

  @override
  State<MainOnBoardingScreen> createState() => _MainOnBoardingScreenState();
}

class _MainOnBoardingScreenState extends State<MainOnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (_currentIndex > 0) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF6E1312),
        body: Stack(
          children: [
            // Background tekstur di-*render* satu kali saja di layer terdalam
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/features/on_boarding/images/texture_welcome_1.png",
              ),
            ),
            // Menggunakan PageView untuk menangani setiap slide-nya tanpa perlu re-render latar
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              physics: const ClampingScrollPhysics(), // Memungkinkan geser secara manual (swipeable)
              children: [
                WelcomeScreen(onNext: _nextPage),
                InformationScreen(onNext: _nextPage),
                const CompleteScreen(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
