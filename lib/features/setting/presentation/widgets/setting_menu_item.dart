import 'package:flutter/material.dart';

class SettingMenuItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? trailingText;
  final bool showBorder;

  const SettingMenuItem({
    super.key,
    required this.title,
    this.subtitle,
    this.trailingText,
    required this.showBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          subtitle:
              subtitle != null
                  ? Text(
                    subtitle!,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                  )
                  : null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailingText != null)
                Text(
                  trailingText!,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
              if (trailingText != null) const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF910A19),
                size: 18,
              ),
            ],
          ),
          onTap: () {},
        ),
        if (showBorder)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ),
      ],
    );
  }
}
