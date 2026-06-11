import 'package:flutter/material.dart';

class HomeEWallet extends StatelessWidget {
  const HomeEWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ), // Sesuai dengan padding umum aplikasi
          child: Text(
            'E-Wallet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PaymentCard(
                title: 'OCTO Pay',
                balance: '1.500.000',
                currency: 'Rp',
                onAddTap: () {
                  // Tambahkan aksi top up / hubungkan di sini
                },
              ),
              const SizedBox(width: 16),
              PaymentCard(
                title: 'Gopay',
                balance: '350.000',
                currency: 'Rp',
                onAddTap: () {
                  // Tambahkan aksi top up / hubungkan di sini
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PaymentCard extends StatefulWidget {
  // 1. Definisikan parameter (props) yang dibutuhkan
  final String title;
  final String balance;
  final String currency;
  final VoidCallback? onAddTap;

  const PaymentCard({
    super.key,
    required this.title,
    required this.balance,
    this.currency = 'IDR', // Default value IDR jika tidak diisi
    this.onAddTap,
  });

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  // State untuk visibilitas saldo tetap diatur secara lokal di dalam komponen
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFFFFFFF), Color(0xFFDBDCDE)],
          ),
          border: Border.all(color: Color(0xFFE2E8F0), width: 2),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 2. Panggil props title
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),

                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    // 3. Panggil props fungsi onAddTap
                    onTap: widget.onAddTap,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFF910A19),
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      _isObscured
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),

                // 4. Gabungkan props currency dan balance
                Text(
                  _isObscured
                      ? '${widget.currency} ***'
                      : '${widget.currency} ${widget.balance}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0D1634),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
