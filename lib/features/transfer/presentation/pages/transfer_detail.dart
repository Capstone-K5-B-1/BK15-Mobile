import 'package:flutter/material.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';
import 'package:b1k5_mobile/features/transfer/presentation/pages/transfer_pin_auth.dart';

class TransferDetail extends StatefulWidget {
  const TransferDetail({super.key});

  @override
  State<TransferDetail> createState() => _TransferDetailState();
}

class _TransferDetailState extends State<TransferDetail> {
  String _selectedTransactionType = 'IMMEDIATE';
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

  bool get _isFormValid =>
      _amountController.text.isNotEmpty && _remarksController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_onFieldChanged);
    _remarksController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _amountController.removeListener(_onFieldChanged);
    _remarksController.removeListener(_onFieldChanged);
    _amountController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
          // Container Profil & Info
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
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Container Info Detail
          const Text(
            'Info Detail',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFEBEBEB)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '456 - 789 - 123 - IDR',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 4),
                Text('TAHAPAN - IDR', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Row Mata Uang dan Amount
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Source of Funds',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8), // Memberi sedikit jarak
                  SizedBox(
                    width: 60,
                    child: TextField(
                      textAlign: TextAlign.start,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'IDR',
                        hintStyle: TextStyle(
                          color: Color(0xFF777777),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.zero, // Kunci agar rata kiri sempurna
                        isDense: true, // Mengurangi padding bawaan material
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    // const SizedBox(height: 8),
                    TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 16, // Membuat teks amount lebih menonjol
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF910A19),
                            width: 2,
                          ),
                        ),
                        // contentPadding: EdgeInsets.only(bottom: 0),
                        contentPadding: EdgeInsets.only(bottom: 12.0, top: 4.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Remarks Input Field
          TextField(
            controller: _remarksController,
            decoration: const InputDecoration(
              hintText: 'Remarks',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEBEBEB)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEBEBEB)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF910A19), width: 2),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Transaction Type Section
          const Text(
            'Transaction Type',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildTransactionTypeButton('IMMEDIATE'),
              const SizedBox(width: 16),
              _buildTransactionTypeButton('SCHEDULED'),
              const SizedBox(width: 8),
              _buildTransactionTypeButton('RECURRING'),
            ],
          ),
          const SizedBox(height: 48),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CustomButton(
            text: 'Continue',
            backgroundColor: _isFormValid ? const Color(0xFF910A19) : const Color(0xFFC2C2C2),
            textColor: Colors.white,
            borderRadius: 24,
            onPressed: () {
              if (!_isFormValid) return;
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TransferPinAuth(),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildTransactionTypeButton(String title) {
    bool isSelected = _selectedTransactionType == title;
    return SizedBox(
      width: 88,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF910A19) : Colors.white,
          foregroundColor: isSelected ? Colors.white : const Color(0xFF910A19),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(
            color:
                isSelected ? const Color(0xFF910A19) : const Color(0xFFEBEBEB),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          setState(() {
            _selectedTransactionType = title;
          });
        },
        child: Text(
          title,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
