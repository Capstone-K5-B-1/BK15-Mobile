import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:b1k5_mobile/shared/widgets/feedback/status.dart';

class QrisStatus extends StatelessWidget {
  final bool isSuccess;

  const QrisStatus({super.key, this.isSuccess = true});

  @override
  Widget build(BuildContext context) {
    return Status(
      isSuccess: isSuccess,
      title: isSuccess ? 'Success' : 'Failed',
      description: isSuccess
          ? 'Your payment has been processed successfully.'
          : 'We could not process your payment. Please try again.',
      buttonText: isSuccess ? 'Back to Home' : 'Try Again',
      onPressed: () {
        if (isSuccess) {
          // Membersihkan tumpukan route dari Navigator manual (seperti bottom sheet / MaterialPageRoute)
          Navigator.of(context, rootNavigator: true).popUntil((route) => route.isFirst);
          // Paksa GoRouter untuk refresh ke MainNavbar
          context.go('/MainNavbar', extra: DateTime.now().millisecondsSinceEpoch.toString());
        } else {
          Navigator.pop(context); // Kembali untuk mencoba lagi
        }
      },
    );
  }
}
