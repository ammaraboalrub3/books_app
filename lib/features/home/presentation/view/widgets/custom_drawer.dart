import 'package:flutter/material.dart';
import 'package:bookly/core/helper/app_controler.dart'; // فيه AppController
import 'package:bookly/generated/l10n.dart'; // S.of(context)
// ملاحظة: تجنّب تكرار نفس import مرتين

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final merged = Listenable.merge([
      AppController.themeMode,
      AppController.locale,
    ]);

    return AnimatedBuilder(
      animation: merged,
      builder: (context, _) {
        final t = S.of(context);
        final isDark = AppController.themeMode.value == ThemeMode.dark;
        final isAr = AppController.locale.value.languageCode == 'ar';

        return Drawer(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: AppController.toggleLocale,
                  child: Text(t.languge),
                ),
                const SizedBox(height: 24),

                ElevatedButton.icon(
                  onPressed: AppController.toggleThemeMode,
                  icon: Icon(isDark ? Icons.wb_sunny : Icons.dark_mode),
                  label: Text(
                    isDark
                        ? (isAr ? 'تبديل إلى الفاتح' : 'Switch to Light')
                        : (isAr ? 'تبديل إلى الداكن' : 'Switch to Dark'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
