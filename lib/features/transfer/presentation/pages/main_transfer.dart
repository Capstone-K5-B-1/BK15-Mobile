import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/transfer/presentation/pages/transfer_header.dart';
import 'package:b1k5_mobile/features/transfer/presentation/pages/transfer_search.dart';
import 'package:b1k5_mobile/features/transfer/presentation/pages/transfer_detail.dart';

class MainTransfer extends StatefulWidget {
  const MainTransfer({super.key});

  @override
  State<MainTransfer> createState() => _MainTransferState();
}

class _MainTransferState extends State<MainTransfer> {
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
      body: Column(
        children: [
          const TransferHeader(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                physics:
                    const NeverScrollableScrollPhysics(), // Memungkinkan geser secara manual (swipeable)
                children: [
                  TransferSearch(onNext: _nextPage),
                  const TransferDetail(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
