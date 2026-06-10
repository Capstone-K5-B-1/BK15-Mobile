import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// File ini akan di-generate oleh build_runner
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookCatalog());
}

@widgetbook.App()
class WidgetbookCatalog extends StatelessWidget {
  const WidgetbookCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        ThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(),
            ),
          ],
          themeBuilder: (context, theme, child) {
            return Theme(
              data: theme,
              child: child,
            );
          },
        ),
        TextScaleAddon(
          scales: [1.0, 1.25, 1.5, 2.0],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.ios.iPhone13ProMax,
            Devices.android.samsungGalaxyS20,
          ],
          initialDevice: Devices.ios.iPhone13,
        ),
      ],
    );
  }
}
