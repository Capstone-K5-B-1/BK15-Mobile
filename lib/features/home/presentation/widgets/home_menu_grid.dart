import 'package:flutter/material.dart';

class HomeMenuGrid extends StatelessWidget {
  const HomeMenuGrid({super.key});

  Widget _buildMenuIcon(String asset, String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(asset, height: 40, width: 40),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, height: 1.2),
          ),
        ],
      ),
    );
  }

  Widget _buildIconGridRow(List<Widget> children) {
    List<Widget> rowChildren = [];
    for (int i = 0; i < 5; i++) {
      if (i < children.length) {
        rowChildren.add(Expanded(child: children[i]));
      } else {
        rowChildren.add(Expanded(child: const SizedBox()));
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rowChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          _buildIconGridRow([
            _buildMenuIcon('assets/features/home/icons/transfer.webp', 'Transfer'),
            _buildMenuIcon('assets/features/home/icons/bills_and_top_up.webp', 'Bills &\nTop Up'),
            _buildMenuIcon('assets/features/home/icons/cardless.webp', 'Cardless'),
            _buildMenuIcon('assets/features/home/icons/electronic_card.webp', 'Electronic\nCard'),
            _buildMenuIcon('assets/features/home/icons/verify_with_octo.webp', 'Verify with\nOCTO'),
          ]),
          const SizedBox(height: 20),
          _buildIconGridRow([
            _buildMenuIcon('assets/features/home/icons/my_schedule.webp', 'My\nSchedule'),
            _buildMenuIcon('assets/features/home/icons/investment.webp', 'Investment'),
            _buildMenuIcon('assets/features/home/icons/promo_code.webp', 'Promo\nCode'),
            _buildMenuIcon('assets/features/home/icons/savings_and_deposit.webp', 'Savings\n& Deposit'),
          ]),
        ],
      ),
    );
  }
}
