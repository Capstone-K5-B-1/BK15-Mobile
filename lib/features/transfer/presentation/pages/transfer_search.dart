import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TransferSearch extends StatelessWidget {
  final VoidCallback onNext;

  const TransferSearch({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Color(
                  0xFFC2C2C2,
                ), // Warna abu-abu kustom untuk hint text
                fontSize: 14, // Kamu juga bisa mengatur ukuran font-nya di sini
              ),
              prefixIconColor: const Color(0xFFC2C2C2),
              prefixIcon: Icon(LucideIcons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(
                    0xFFEBEBEB,
                  ), // Warna border abu-abu saat didiamkan
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(
                    0xFF910A19,
                  ), // Warna border berubah jadi Maroon saat diketik
                  width: 2.0, // Biasanya dibuat sedikit lebih tebal agar tegas
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical:
                    8.0, // Mengatur jarak atas dan bawah teks di dalam kotak
                horizontal:
                    20.0, // Mengatur jarak kiri dan kanan teks dari garis tepi
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              fixedSize: Size(MediaQuery.of(context).size.width, 48),
              backgroundColor: const Color(0xFF910A19),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onNext,
            child: Row(
              children: [
                Icon(LucideIcons.userPlus, size: 24),
                const SizedBox(width: 12),
                const Text('Transfer to new beneficiary', style: TextStyle(fontSize: 14)),
                const Spacer(),
                Icon(LucideIcons.chevronRight, size: 24,),
              ],
            ),
          ), 
        ],
      ),
    );
  }
}
