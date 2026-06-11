import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/global/icons/logo.webp', height: 28),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.search, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.notifications_none, color: Colors.white, size: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 40.0, bottom: 0),
          child: RichText(
            text: const TextSpan(
              text: 'Good morning, ',
              style: TextStyle(color: Colors.white, fontSize: 14),
              children: [
                TextSpan(
                  text: 'How are you?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]
            ),
          ),
        ),
      ],
    );
  }
}
