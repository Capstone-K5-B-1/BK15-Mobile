import 'package:flutter/material.dart';

class TransferDetail extends StatefulWidget {
  const TransferDetail({super.key});

  @override
  State<TransferDetail> createState() => _TransferDetailState();
}

class _TransferDetailState extends State<TransferDetail> {
  String _selectedTransactionType = 'IMMEDIATE';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            crossAxisAlignment: CrossAxisAlignment.end,
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
                        contentPadding: EdgeInsets.zero, // Kunci agar rata kiri sempurna
                        isDense: true, // Mengurangi padding bawaan material
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  
                ],
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 24, // Membuat teks amount lebih menonjol
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Amount',
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
                    contentPadding: EdgeInsets.only(bottom: 8),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Remarks Input Field
          TextField(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTransactionTypeButton('IMMEDIATE'),
              const SizedBox(width: 8),
              _buildTransactionTypeButton('SCHEDULED'),
              const SizedBox(width: 8),
              _buildTransactionTypeButton('RECURRING'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionTypeButton(String title) {
    bool isSelected = _selectedTransactionType == title;
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF910A19) : Colors.white,
          foregroundColor: isSelected ? Colors.white : const Color(0xFF910A19),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12),
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
