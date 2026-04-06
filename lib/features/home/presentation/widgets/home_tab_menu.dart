import 'package:flutter/material.dart';

class HomeTabMenu extends StatefulWidget {
  const HomeTabMenu({super.key});

  @override
  State<HomeTabMenu> createState() => _HomeTabMenuState();
}

class _HomeTabMenuState extends State<HomeTabMenu> {
  String _selectedTab = 'For You';

  final List<String> _tabs = [
    'For You',
    'Transactions',
    'Products',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _tabs.map((tab) {
          final isSelected = _selectedTab == tab;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTab = tab;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF910A19).withOpacity(0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tab,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF910A19) : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

