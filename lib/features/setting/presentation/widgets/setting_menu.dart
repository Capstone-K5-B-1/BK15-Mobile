import 'package:flutter/material.dart';
import 'setting_menu_item.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Section
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              child: Image.asset(
                'assets/features/home/icons/display_and_others.png',
                width: 32,
                height: 32,
              ),
            ),
            // const SizedBox(width: 4),
            Text(
              'Display & Others',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Menu Container
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Column(
            children: [
              SettingMenuItem(
                title: 'Theme',
                subtitle: 'Default',
                showBorder: true,
              ),
              SettingMenuItem(
                title: 'About',
                subtitle: 'Privacy Policy and our social media info',
                showBorder: true,
              ),
              SettingMenuItem(
                title: 'Version',
                trailingText: '3.1.84',
                showBorder: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
