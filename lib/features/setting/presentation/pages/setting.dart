import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_header.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_profile.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_menu.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Column(
        children: [
          SettingHeader(),
          SizedBox(height: 30),
          SettingProfile(),
          SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SettingMenu(),
            ),
          ),
        ],
      ),
    );
  }
}
