import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum ToastType { success, error, warning, info }

class AppToast extends StatelessWidget {
  final String message;
  final ToastType type;
  final IconData? icon;

  const AppToast({
    super.key,
    required this.message,
    this.type = ToastType.info,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    IconData defaultIcon;

    switch (type) {
      case ToastType.success:
        bgColor = Colors.green.shade600;
        defaultIcon = LucideIcons.checkCircle;
        break;
      case ToastType.error:
        bgColor = Colors.red.shade600;
        defaultIcon = LucideIcons.alertCircle;
        break;
      case ToastType.warning:
        bgColor = Colors.orange.shade600;
        defaultIcon = LucideIcons.alertTriangle;
        break;
      case ToastType.info:
      default:
        bgColor = Colors.blue.shade600;
        defaultIcon = LucideIcons.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ?? defaultIcon, color: Colors.white, size: 20),
          const SizedBox(width: 12.0),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper untuk memanggil toast secara global. 
  /// context di sini diperlukan oleh FToast.
  static void show(
    BuildContext context, {
    required String message,
    ToastType type = ToastType.info,
    IconData? icon,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration duration = const Duration(seconds: 2),
  }) {
    final fToast = FToast()..init(context);
    
    // Hilangkan toast yang sedang aktif (opsional)
    fToast.removeCustomToast();
    
    fToast.showToast(
      child: AppToast(message: message, type: type, icon: icon),
      gravity: gravity,
      toastDuration: duration,
    );
  }
}
