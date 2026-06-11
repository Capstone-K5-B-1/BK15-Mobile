import 'package:flutter/material.dart';

class PinAuth extends StatefulWidget {
  final Function(String pin) onPinCompleted;

  const PinAuth({super.key, required this.onPinCompleted});

  @override
  State<PinAuth> createState() => _PinAuthState();
}

class _PinAuthState extends State<PinAuth> {
  String _pin = "";

  void _inputNumber(String number) {
    if (_pin.length < 6) {
      setState(() {
        _pin += number;
      });
    }

    if (_pin.length == 6) {
      widget.onPinCompleted(_pin);
    }
  }

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
      padding: const EdgeInsets.only(top: 16),
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
              bool isFilled = index < _pin.length;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isFilled ? const Color(0xFF910A19) : Colors.grey[300],
                ),
              );
            }),
          ),

          const SizedBox(height: 36),

          // 2. CUSTOM NUMPAD KEYBOARD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.3,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                if (index == 9) {
                  return const Center(child: Text('.', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
                } else if (index == 10) {
                  return _buildKeyboardButton("0");
                } else if (index == 11) {
                  return IconButton(
                    icon: const Icon(Icons.backspace_outlined, size: 24),
                    onPressed: _deleteNumber,
                  );
                } else {
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

  Widget _buildKeyboardButton(String label) {
    return InkWell(
      onTap: () => _inputNumber(label),
      borderRadius: BorderRadius.circular(100),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
