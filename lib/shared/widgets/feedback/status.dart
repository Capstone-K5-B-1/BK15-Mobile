import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';

class Status extends StatelessWidget {
  final bool isSuccess;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const Status({
    super.key,
    required this.isSuccess,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // Icon Status
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: isSuccess ? const Color(0xFF19BC00) : Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isSuccess ? LucideIcons.check : LucideIcons.x,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              const SizedBox(height: 24),
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              // Description
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Action Button
              CustomButton(
                text: buttonText,
                backgroundColor: const Color(0xFF910A19),
                textColor: Colors.white,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
