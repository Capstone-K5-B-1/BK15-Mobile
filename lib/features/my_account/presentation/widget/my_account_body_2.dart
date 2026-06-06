import 'package:flutter/material.dart';

class MyAccountBody2 extends StatelessWidget {
  final String imagePath;
  final String title;
  final String header;
  final String body;
  final VoidCallback? onAddAccount;

  const MyAccountBody2({
    super.key,
    required this.imagePath,
    required this.title,
    required this.header,
    required this.body,
    this.onAddAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              child: Image.asset(imagePath, width: 44, height: 44),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            if (title.toUpperCase().contains('TABUNGAN') || title.toUpperCase().contains('BIRO') || title.toUpperCase().contains('GIRO'))
              GestureDetector(
                onTap: onAddAccount,
                child: Row(
                  children: [
                    Text(
                      'Add \nAccount',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.red.shade900,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.red.shade900,
                      size: 24,
                    ),
                  ],
                ),
              ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                body,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
