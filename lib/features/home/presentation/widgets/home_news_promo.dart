import 'dart:async';
import 'package:flutter/material.dart';

class HomeNewsPromo extends StatefulWidget {
  const HomeNewsPromo({super.key});

  @override
  State<HomeNewsPromo> createState() => _HomeNewsPromoState();
}

class _HomeNewsPromoState extends State<HomeNewsPromo> {
  String _selectedTab = 'All';
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double currentScrollPosition = _scrollController.position.pixels;
        double itemWidth = 360.0 + 16.0; // container width + SizedBox width

        double nextScrollPosition = currentScrollPosition + itemWidth;
        
        if (currentScrollPosition >= maxScrollExtent - 10) {
          nextScrollPosition = 0;
        } else if (nextScrollPosition > maxScrollExtent) {
          nextScrollPosition = maxScrollExtent;
        }

        _scrollController.animateTo(
          nextScrollPosition,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Widget _buildNewsTab(String label) {
    bool isSelected = _selectedTab == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF910A19).withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFF910A19) : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildNewsCard(String imagePath) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'News & Promotion',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildNewsTab('All'),
              const SizedBox(width: 24),
              _buildNewsTab('Promo'),
              const SizedBox(width: 24),
              _buildNewsTab('News'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 160,
          child: ListView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildNewsCard('assets/features/home/images/news_1.png'),
              const SizedBox(width: 16),
              _buildNewsCard('assets/features/home/images/news_2.png'),
              const SizedBox(width: 16),
              _buildNewsCard('assets/features/home/images/news_2.png'),
              const SizedBox(width: 16),
              _buildNewsCard('assets/features/home/images/news_2.png'),
            ],
          ),
        ),
      ],
    );
  }
}
