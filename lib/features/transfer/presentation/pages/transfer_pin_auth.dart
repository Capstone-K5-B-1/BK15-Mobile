import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/transfer/presentation/pages/transfer_status.dart';
import 'package:b1k5_mobile/shared/widgets/button/pin_auth.dart';

class TransferPinAuth extends StatelessWidget {
  const TransferPinAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return PinAuth(
      onPinCompleted: (pin) {
        print("PIN Lengkap: $pin -> Jalankan fungsi transaksi");
        
        // Simulasi proses transaksi sejenak (loading)
        Future.delayed(const Duration(milliseconds: 500), () {
          if (!context.mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const TransferStatus(isSuccess: true), // Simulasi berhasil
            ),
          );
        });
      },
    );
  }
}