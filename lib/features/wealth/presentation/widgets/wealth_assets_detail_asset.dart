import 'package:flutter/material.dart';

class WealthAssetsDetailAsset extends StatelessWidget {
  const WealthAssetsDetailAsset({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: "Detail Asset" and "View More"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Detail Asset',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                // onPadding: EdgeInsets.zero,
                onPressed: () {},
                child: const Text(
                  'View More',
                  style: TextStyle(
                    color: Color(0xFF8A1816), // Maroon
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Second Row: Icon + "Saving & Current Account" and Date
          Container(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.account_balance_wallet,
                          color: Color(0xFF8A1816),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Saving & Current Account',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '17 April 2026',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Horizontal Bar Chart
                LayoutBuilder(
                  builder: (context, constraints) {
                    const double percentage = 75.0; // Example percentage
                    final double filledWidth = constraints.maxWidth * (percentage / 100);

                    return Container(
                      height: 24, // Thickness of the bar
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300, // Unfilled background (abu-abu)
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Stack(
                        children: [
                          // Filled part
                          Container(
                            width: filledWidth,
                            decoration: BoxDecoration(
                              color: const Color(0xFF8A1816), // Filled color (merah marun)
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          // Percentage text
                          Center(
                            child: Text(
                              '${percentage.toInt()}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Balance amount
                const Text(
                  'IDR ***',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                // See more
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'See more',
                            style: TextStyle(
                              color: Color(0xFF8A1816),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF8A1816),
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

