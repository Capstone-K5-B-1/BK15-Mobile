import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/bill_and_top_up/presentation/pages/bill_and_top_up_header.dart';
import 'package:b1k5_mobile/features/bill_and_top_up/presentation/pages/bill_and_top_up_menu.dart';

class MainBillAndTopUp extends StatefulWidget {
  const MainBillAndTopUp({super.key});

  @override
  State<MainBillAndTopUp> createState()=> _MainBillAndTopUpState();
}

class _MainBillAndTopUpState extends State<MainBillAndTopUp> {
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
    return const Scaffold(
      backgroundColor: Color(0xFF910A19), // Match header background color behind the white rounded container
      body: Column(
        children: [
          BillAndTopUpHeader(),
          BillAndTopUpMenu(),
        ],
      ),
    );
  }
}