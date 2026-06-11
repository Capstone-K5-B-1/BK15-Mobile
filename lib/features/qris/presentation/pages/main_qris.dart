import 'package:b1k5_mobile/features/qris/presentation/pages/qris_scan.dart';
import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/qris/presentation/widgets/qris_header.dart';
import 'package:b1k5_mobile/features/qris/presentation/pages/qris_input.dart';

class MainQris extends StatefulWidget {
  const MainQris({super.key});

  @override
  State<MainQris> createState() => _MainQrisState();
}

class _MainQrisState extends State<MainQris> {
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

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            physics: const NeverScrollableScrollPhysics(),
            children: [
              QrisScan(onNext: _nextPage),
              const QrisInput(),
            ],
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: QrisHeader(),
          ),
        ],
      ),
    );
  }
}
