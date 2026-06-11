import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:b1k5_mobile/shared/widgets/input/search_bar.dart';

class TransferSearch extends StatelessWidget {
  final VoidCallback onNext;

  const TransferSearch({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const CustomSearchBar(hintText: 'Search'),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              fixedSize: Size(MediaQuery.of(context).size.width, 48),
              backgroundColor: const Color(0xFF910A19),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onNext,
            child: Row(
              children: [
                Icon(LucideIcons.userPlus, size: 24),
                const SizedBox(width: 12),
                const Text('Transfer to new beneficiary', style: TextStyle(fontSize: 14)),
                const Spacer(),
                Icon(LucideIcons.chevronRight, size: 24,),
              ],
            ),
          ), 
        ],
      ),
    );
  }
}
