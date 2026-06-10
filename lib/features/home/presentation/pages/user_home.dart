import 'package:b1k5_mobile/features/home/presentation/widgets/home_saving_card.dart';
import 'package:flutter/material.dart';

import 'package:b1k5_mobile/features/home/presentation/widgets/home_header.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_tab_menu.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_menu_grid.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_news_promo.dart';
// import 'package:b1k5_mobile/features/home/presentation/widgets/home_login_card.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 260,
              decoration: const BoxDecoration(
                color: Color(0xFF910A19),
              ),
            ),
            SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  const SizedBox(height: 24),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 100),
                            HomeTabMenu(),
                            SizedBox(height: 30),
                            HomeMenuGrid(),
                            SizedBox(height: 30),
                            HomeNewsPromo(),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),
                      // const HomeLoginCard(),
                      const HomeSavingCard()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


