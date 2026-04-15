import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/home/presentation/pages/home.dart';
import 'package:b1k5_mobile/features/my_account/presentation/pages/my_account.dart';
import 'package:b1k5_mobile/features/wealth/presentation/pages/wealth.dart';
import 'package:b1k5_mobile/features/setting/presentation/pages/setting.dart';

class MainNavbar extends StatefulWidget {
  const MainNavbar({super.key});

  @override
  State<MainNavbar> createState() => _MainNavbarState();
}

class _MainNavbarState extends State<MainNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MyAccountPage(),
    const WealthPage(),
    const SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF910A19), // Merah bata / Maroon
        shape: const CircleBorder(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pay',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w300
              ),
            ),
            Image.asset(
              'assets/features/home/icons/qris_logo.png',
              color: Colors.white,
              width: 40,
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, -2), // Shadow mengarah ke atas
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0, // Matikan elevation default
          clipBehavior: Clip.none,
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            CircleBorder(),
          ),
          notchMargin: 8.0,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNavItem(
                      icon: Icons.home_filled,
                      label: 'Home',
                      index: 0,
                    ),
                    _buildNavItem(
                      icon: Icons.credit_card,
                      label: 'My Accounts',
                      index: 1,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNavItem(
                      icon: Icons.monetization_on,
                      label: 'Wealth',
                      index: 2,
                    ),
                    _buildNavItem(
                      icon: Icons.settings,
                      label: 'Settings',
                      index: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? const Color(0xFFf75956) : Colors.grey;

    return MaterialButton(
      minWidth: 80,
      padding: EdgeInsets.zero,
      onPressed: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
