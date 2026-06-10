import 'package:flutter/material.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.only(top: 60, bottom: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF910A19), // Merah bata / Maroon
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        image: DecorationImage(
          image: AssetImage('assets/global/images/header_bg.png'),
          fit: BoxFit.cover
        ),
      ),
      child: const Center(
        child: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
