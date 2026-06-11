import 'package:flutter/material.dart';
import 'package:b1k5_mobile/shared/widgets/input/search_bar.dart';

class BillAndTopUpMenu extends StatefulWidget {
  const BillAndTopUpMenu({super.key});

  @override
  State<BillAndTopUpMenu> createState() => _BillAndTopUpMenuState();
}

class _BillAndTopUpMenuState extends State<BillAndTopUpMenu> {
  String _selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Search Bar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomSearchBar(hintText: 'Search biller...'),
            ),
            const SizedBox(height: 24),
            // Tab Menu Categories
            _BillAndTopUpTabMenu(
              selectedTab: _selectedTab,
              onTabChanged: (tab) {
                setState(() {
                  _selectedTab = tab;
                });
              },
            ),
            const SizedBox(height: 24),
            // Features Grid
            Expanded(
              child: SingleChildScrollView(
                child: _BillAndTopUpMenuGrid(selectedTab: _selectedTab),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------
// Internal Widget untuk Tab Menu
// ----------------------------------------------------------------------
class _BillAndTopUpTabMenu extends StatelessWidget {
  final String selectedTab;
  final ValueChanged<String> onTabChanged;

  const _BillAndTopUpTabMenu({
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['All', 'Bill Payment', 'Top Up', 'Others'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: tabs.map((tab) {
            final isSelected = selectedTab == tab;
            return GestureDetector(
              onTap: () => onTabChanged(tab),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF910A19).withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tab,
                  style: TextStyle(
                    color: isSelected ? const Color(0xFF910A19) : Colors.grey,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------
// Internal Widget untuk Menu Grid
// ----------------------------------------------------------------------
class _MenuItemData {
  final String label;
  final String category;
  final VoidCallback onPressed;

  _MenuItemData({
    required this.label,
    required this.category,
    required this.onPressed,
  });
}

class _BillAndTopUpMenuGrid extends StatelessWidget {
  final String selectedTab;

  const _BillAndTopUpMenuGrid({required this.selectedTab});

  Widget _buildMenuIcon(_MenuItemData item) {
    return GestureDetector(
      onTap: item.onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/features/home/icons/cardless.webp', height: 40, width: 40),
          const SizedBox(height: 8),
          Text(
            item.label,
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
    final List<_MenuItemData> allItems = [
      _MenuItemData(label: 'Wallet', category: 'Top Up', onPressed: () {
        print("Tap Wallet");
        // context.go('/BillAndTopUpWallet');
      }),
      _MenuItemData(label: 'Phone/Mobile', category: 'Top Up', onPressed: () {}),
      _MenuItemData(label: 'TAX', category: 'Bill Payment', onPressed: () {}),
      _MenuItemData(label: 'PAM/PDAM', category: 'Bill Payment', onPressed: () {}),
      _MenuItemData(label: 'e-Commerce\n& Payment', category: 'Others', onPressed: () {}),
      _MenuItemData(label: 'Electricity', category: 'Bill Payment', onPressed: () {}),
      _MenuItemData(label: 'Investment', category: 'Others', onPressed: () {}),
      _MenuItemData(label: 'Virtual\nAccount', category: 'Top Up', onPressed: () {}),
      _MenuItemData(label: 'Internet /\nCable TV', category: 'Bill Payment', onPressed: () {}),
      _MenuItemData(label: 'BPJS', category: 'Bill Payment', onPressed: () {}),
    ];

    final filteredItems = selectedTab == 'All'
        ? allItems
        : allItems.where((item) => item.category == selectedTab).toList();

    List<Widget> rows = [];
    for (int i = 0; i < filteredItems.length; i += 5) {
      final end = (i + 5 < filteredItems.length) ? i + 5 : filteredItems.length;
      final rowItems = filteredItems.sublist(i, end).map((item) => _buildMenuIcon(item)).toList();
      rows.add(_buildIconGridRow(rowItems));
      
      if (end < filteredItems.length) {
        rows.add(const SizedBox(height: 20));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: rows.isNotEmpty 
            ? rows 
            : [const Center(child: Padding(padding: EdgeInsets.only(top: 40), child: Text('No features found')))],
      ),
    );
  }
}
