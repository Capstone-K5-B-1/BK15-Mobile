import 'package:flutter/material.dart';

class WealthAssetHeader extends StatefulWidget {
  const WealthAssetHeader({super.key});

  @override
  State<WealthAssetHeader> createState() => _WealthAssetHeaderState();
}

class _WealthAssetHeaderState extends State<WealthAssetHeader> {
  DateTime _currentDate = DateTime.now();

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> monthNames = [
      '', 'January', 'February', 'March', 'April', 'May', 'June', 
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: _previousMonth,
                  icon: const Icon(Icons.chevron_left, color: Color(0xFF8A1816), size: 30,),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${_currentDate.year}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      monthNames[_currentDate.month],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: _nextMonth,
                  icon: const Icon(Icons.chevron_right, color: Color(0xFF8A1816), size: 30,),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.download, color: Color(0xFF8A1816), size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
