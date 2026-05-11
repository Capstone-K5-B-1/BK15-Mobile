import 'package:flutter/material.dart';

class WealthTabBar extends StatelessWidget {
  const WealthTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
        ),
      ),
      child: const TabBar(
        indicatorColor: Color(0xFF910A19), // Merah marun
        indicatorWeight: 3.0,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Color(0xFF910A19),
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        tabs: [
          Tab(text: "Asset"),
          Tab(text: "Admission Fee"),
          Tab(text: "Money Out"),
        ],
      ),
    );
  }
}
