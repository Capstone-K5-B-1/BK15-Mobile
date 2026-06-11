import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const CustomSearchBar({
    super.key,
    this.hintText = 'Search',
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFC2C2C2), // Warna abu-abu kustom untuk hint text
          fontSize: 14, // Ukuran font
        ),
        prefixIconColor: const Color(0xFFC2C2C2),
        prefixIcon: const Icon(LucideIcons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFEBEBEB), // Warna border abu-abu saat didiamkan
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF910A19), // Warna border Maroon saat diketik
            width: 2.0, // Sedikit lebih tebal agar tegas
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0, // Mengatur jarak atas dan bawah teks di dalam kotak
          horizontal: 20.0, // Mengatur jarak kiri dan kanan teks dari tepi
        ),
      ),
    );
  }
}
