import 'package:flutter/material.dart';

class HomeNewsPromo extends StatelessWidget {
  const HomeNewsPromo({super.key});

  Widget _buildNewsTab(String label, bool isSelected) {
    if (isSelected) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.05),
          border: Border.all(color: Colors.red.shade200),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13),
        ),
      );
    } else {
      return Text(
        label,
        style: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14),
      );
    }
  }

  Widget _buildNewsCard(String imagePath) {
    return Container(
      width: 280,
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
              _buildNewsTab('All', true),
              const SizedBox(width: 24),
              _buildNewsTab('Promo', false),
              const SizedBox(width: 24),
              _buildNewsTab('News', false),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildNewsCard('assets/features/home/images/news_1.png'),
              const SizedBox(width: 16),
              _buildNewsCard('assets/features/home/images/news_2.png'),
            ],
          ),
        ),
      ],
    );
  }
}
