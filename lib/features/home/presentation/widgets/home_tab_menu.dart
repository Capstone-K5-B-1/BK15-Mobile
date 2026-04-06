import 'package:flutter/material.dart';

class HomeTabMenu extends StatelessWidget {
  const HomeTabMenu({super.key});

  Widget _buildTopTab(String label, bool isSelected) {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildTopTab('For You', true),
          const SizedBox(width: 24),
          _buildTopTab('Transactions', false),
          const SizedBox(width: 24),
          _buildTopTab('Products', false),
          const SizedBox(width: 24),
          _buildTopTab('Others', false),
        ],
      ),
    );
  }
}
