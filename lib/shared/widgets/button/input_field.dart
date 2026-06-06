import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomInputField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? suffixActionText;
  final VoidCallback? onSuffixActionTap;
  final String? helperText;
  final bool showClearIcon;

  const CustomInputField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.suffixActionText,
    this.onSuffixActionTap,
    this.helperText,
    this.showClearIcon = true,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _controller,
          obscureText: widget.isPassword ? _obscureText : false,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          cursorColor: const Color(0xFFF56564), // Warna merah saat aktif
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 16,
            ),
            contentPadding: const EdgeInsets.fromLTRB(6, 12, 0, 0),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFF56564), width: 1.5),
            ),
            suffixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.showClearIcon && _controller.text.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      _controller.clear();
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(6, 12, 0, 0),
                      child: Icon(
                        LucideIcons.x,
                        color: Colors.white.withOpacity(0.8),
                        size: 20,
                      ),
                    ),
                  ),
                if (widget.isPassword)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                      child: Icon(
                        _obscureText ? LucideIcons.eyeOff : LucideIcons.eye,
                        color: Colors.white.withOpacity(0.8),
                        size: 20,
                      ),
                    ),
                  ),
                if (widget.suffixActionText != null)
                  GestureDetector(
                    onTap: widget.onSuffixActionTap,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                      child: Text(
                        widget.suffixActionText!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (widget.helperText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.helperText!,
              style: const TextStyle(
                color: Colors.white, // Teks keterangan berwarna merah
                fontSize: 10,
              ),
            ),
          ),
      ],
    );
  }
}
