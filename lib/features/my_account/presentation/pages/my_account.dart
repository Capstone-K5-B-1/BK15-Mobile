import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/my_account/presentation/widget/my_account_header.dart';
import 'package:b1k5_mobile/features/my_account/presentation/widget/my_account_body_1.dart';
import 'package:b1k5_mobile/features/my_account/presentation/widget/my_account_body_2.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const MyAccountHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  const MyAccountBody1(),
                  const SizedBox(height: 24),
                  MyAccountBody2(
                    imagePath: 'assets/features/my_account/icons/octo_pay.png',
                    title: 'OCTO PAY',
                    header: 'OCTO PAY',
                    body: 'IDR ' + '900000',
                  ),
                  const SizedBox(height: 24),
                  MyAccountBody2(
                    imagePath: 'assets/features/my_account/icons/xtra_points.png',
                    title: 'XTRA POINTS',
                    header: 'Poin Xtra',
                    body: '0' + ' Poin',
                  ),
                  const SizedBox(height: 24),
                  MyAccountBody2(
                    imagePath: 'assets/features/my_account/icons/tabungan_giro.png',
                    title: 'TABUNGAN & BIRO',
                    header: 'My Savings',
                    body: 'IDR ' + '900000',
                    onAddAccount: () {
                      print("Add Account pressed");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
