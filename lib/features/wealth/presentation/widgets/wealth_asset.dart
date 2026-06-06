import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/wealth/presentation/widgets/wealth_asset_header.dart';
import 'package:b1k5_mobile/features/wealth/presentation/widgets/wealth_asset_chart.dart';
import 'package:b1k5_mobile/features/wealth/presentation/widgets/wealth_asset_instruction.dart';
import 'package:b1k5_mobile/features/wealth/presentation/widgets/wealth_assets_detail_asset.dart';
import 'package:b1k5_mobile/features/wealth/presentation/widgets/wealth_asset_total_asset.dart';

class WealthAsset extends StatelessWidget {
  const WealthAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WealthAssetHeader(),
          const WealthAssetChart(),
          const SizedBox(height: 16),
          const WealthAssetInstruction(),
          const WealthAssetTotalAsset(),
          const WealthAssetsDetailAsset(),
        ],
      ),
    );
  }
}
