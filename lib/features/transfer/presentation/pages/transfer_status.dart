import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';
import 'package:go_router/go_router.dart';

class TransferStatus extends StatelessWidget {
  final bool isSuccess;

  const TransferStatus({super.key, this.isSuccess = true});

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
                  color: isSuccess ? Color(0xFF19BC00) : Colors.red,
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
                isSuccess ? 'Success' : 'Failed',
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
                isSuccess
                    ? 'Your transaction has been processed successfully.'
                    : 'We could not process your transaction. Please try again.',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Action Button
              CustomButton(
                text: isSuccess ? 'Back to Home' : 'Try Again',
                backgroundColor: const Color(0xFF910A19),
                textColor: Colors.white,
                onPressed: () {
                  if (isSuccess) {
                    context.go('/MainNavbar');
                  } else {
                    Navigator.pop(context); // Kembali untuk mencoba lagi
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
