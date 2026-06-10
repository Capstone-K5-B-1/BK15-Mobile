import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook/widgetbook.dart';
import 'package:b1k5_mobile/shared/widgets/feedback/app_toast.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: AppToast,
)
Widget buildAppToastUseCase(BuildContext context) {
  // Knobs configuration
  final message = context.knobs.string(
    label: 'Message',
    initialValue: 'This is a toast message',
  );

  final type = context.knobs.list<ToastType>(
    label: 'Toast Type',
    options: ToastType.values,
    initialOption: ToastType.success,
  );

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Preview komponen asli (hanya untuk tampilan visual di Widgetbook)
        const Text(
          'Inline Preview:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 16),
        AppToast(
          message: message,
          type: type,
        ),
        const SizedBox(height: 48),
        // Tombol untuk mencoba fungsionalitas toast yang sebenarnya
        ElevatedButton(
          onPressed: () {
            AppToast.show(
              context,
              message: message,
              type: type,
            );
          },
          child: const Text('Tampilkan FToast (Overlay)'),
        ),
      ],
    ),
  );
}
