import 'package:flutter/material.dart';

class WealthAssetInstruction extends StatefulWidget {
  const WealthAssetInstruction({super.key});

  @override
  State<WealthAssetInstruction> createState() => _WealthAssetInstructionState();
}

class _WealthAssetInstructionState extends State<WealthAssetInstruction> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, // Border bawah berwarna abu
            width: 1.0,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: const Text(
            'Instruction', // Sisi kiri: placeholder / value
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down, // Sisi kanan: icon arrow down
            color: Color(0xFF8A1816),
            size: 30,
          ),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          elevation: 4,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          isExpanded: true,
          items: [
            'Instruction 1',
            'Instruction 2',
            'Instruction 3',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
        ),
      ),
    );
  }
}
