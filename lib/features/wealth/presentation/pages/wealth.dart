import 'package:b1k5_mobile/features/wealth/presentation/widgets/wealth_header.dart';
import 'package:b1k5_mobile/features/wealth/presentation/widgets/wealth_tab_bar.dart';
import 'package:b1k5_mobile/features/wealth/presentation/widgets/wealth_asset.dart';
import 'package:flutter/material.dart';

class WealthPage extends StatelessWidget {
  const WealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const WealthHeader(),
            const WealthTabBar(),
            const Expanded(
              child: TabBarView(
                children: [
                  WealthAsset(),
                  Center(child: Text("Admission Fee Content")),
                  Center(child: Text("Money Out Content")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
