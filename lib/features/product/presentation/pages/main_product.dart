import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/product/presentation/widgets/product_header.dart';
import 'package:b1k5_mobile/features/product/presentation/widgets/product_slider.dart';
import 'package:b1k5_mobile/features/product/presentation/widgets/product_panel.dart';

class MainProduct extends StatefulWidget {
  const MainProduct({super.key});

  @override
  State<MainProduct> createState() => _MainProductState();
}

class _MainProductState extends State<MainProduct> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      backgroundColor: Color(0xFF910A19), // Red background
      body: Column(
        children: [
          ProductHeader(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      ProductSlider(),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
                const SliverFillRemaining(
                  hasScrollBody: true,
                  child: ProductPanel(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
