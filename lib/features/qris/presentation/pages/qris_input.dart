import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';
import 'package:b1k5_mobile/features/qris/presentation/pages/qris_pin_auth.dart';

class QrisInput extends StatefulWidget {
  const QrisInput({super.key});

  @override
  State<QrisInput> createState() => _QrisInputState();
}

class _QrisInputState extends State<QrisInput> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  bool get _isFormValid =>
      _amountController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_onFieldChanged);
    _noteController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _amountController.removeListener(_onFieldChanged);
    _noteController.removeListener(_onFieldChanged);
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding top 120 agar tidak tertimpa QrisHeader yang di-stack
      padding: const EdgeInsets.only(top: 160, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // Avatar Placeholder
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.person, color: Colors.grey),
                        ),
                        const SizedBox(width: 16),
                        // Nama dan Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Auryn Zafeera',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '456 - 789 - 123 - IDR',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Payment Amount',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFEBEBEB)),
                    ),
                    child: Column(
                      children: [
                        // Row pertama berisi input nominal
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Rp',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: TextField(
                                      controller: _amountController,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        fontSize:
                                            18, // Membuat teks amount lebih menonjol
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: '0',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF777777),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Enter the amount to be paid.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Garis pemisah antar baris
                        const Divider(
                          height: 1,
                          color: Color(0xFFEBEBEB),
                          thickness: 1,
                        ),

                        // Row kedua berisi input note
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                LucideIcons.fileText,
                                size: 20,
                                color: Color(0xFF777777),
                              ),
                              const SizedBox(width: 8), // Sedikit jarak antara icon dan textfield
                              Expanded(
                                child: TextField(
                                  controller: _noteController,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFD5D5D5),
                                    ),
                                    hintText: 'Add a note (optional)',
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    // contentPadding: EdgeInsets.symmetric(
                                    //   vertical: 12,
                                    // ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: CustomButton(
              text: 'Continue',
              backgroundColor:
                  _isFormValid
                      ? const Color(0xFF910A19)
                      : const Color(0xFFC2C2C2),
              textColor: Colors.white,
              borderRadius: 24,
              onPressed: () {
                if (!_isFormValid) return;
                 showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: const QrisPinAuth(),
                ),
              );
                // TODO: Tambahkan aksi setelah Continue (misal: buka PIN Auth)
              },
            ),
          ),
        ],
      ),
    );
  }
}
