import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/transfer/presentation/pages/transfer_status.dart';

class TransferPinAuth extends StatefulWidget {
  const TransferPinAuth({super.key});

  @override
  State<TransferPinAuth> createState() => _TransferPinAuthState();
}

class _TransferPinAuthState extends State<TransferPinAuth> {
  String _pin = ""; // Menampung input PIN sementara

  // Fungsi saat tombol angka ditekan
  void _inputNumber(String number) {
    if (_pin.length < 6) {
      setState(() {
        _pin += number;
      });
    }

    // Jika sudah 6 digit, langsung eksekusi verifikasi
    if (_pin.length == 6) {
      print("PIN Lengkap: $_pin -> Jalankan fungsi transaksi");
      
      // Simulasi proses transaksi sejenak (loading)
      Future.delayed(const Duration(milliseconds: 500), () {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TransferStatus(isSuccess: true), // Simulasi berhasil
          ),
        );
      });
    }
  }

  // Fungsi untuk tombol hapus (backspace)
  void _deleteNumber() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Authentication',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF910A19)),
          ),
          const SizedBox(height: 36),
          const Text('Enter Your PIN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 24),

          // 1. INDIKATOR BULATAN PIN (6 DOTS)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) {
              // Jika index kurang dari panjang PIN, warnai bulatan (terisi)
              bool isFilled = index < _pin.length;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isFilled ? const Color(0xFF910A19) : Colors.grey[300], // Maroon jika terisi
                ),
              );
            }),
          ),

          const SizedBox(height: 36),

          // 2. CUSTOM NUMPAD KEYBOARD (Gunakan GridView)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 Kolom ke samping
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.3, // Mengatur proporsi kotak tombol
              ),
              itemCount: 12, // 1 sampai 9, titik, 0, dan backspace
              itemBuilder: (context, index) {
                // Tentukan isi tiap tombol berdasarkan posisi index grid
                if (index == 9) {
                  return const Center(child: Text('.', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
                } else if (index == 10) {
                  return _buildKeyboardButton("0");
                } else if (index == 11) {
                  // Tombol Backspace / Hapus
                  return IconButton(
                    icon: const Icon(Icons.backspace_outlined, size: 24),
                    onPressed: _deleteNumber,
                  );
                } else {
                  // Tombol Angka 1 - 9
                  String number = (index + 1).toString();
                  return _buildKeyboardButton(number);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget untuk membuat tombol angka biar kodenya rapi
  Widget _buildKeyboardButton(String label) {
    return InkWell(
      onTap: () => _inputNumber(label),
      borderRadius: BorderRadius.circular(100), // Efek klik membulat rapi
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}