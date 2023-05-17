import 'package:flutter/material.dart';
import 'package:yummy/core/manifest/manifest.dart';
import 'package:yummy/features/app_colors/presentation/widgets/app_icon.dart';

import '../../../../core/theme/app_colors.dart';
import 'simple_icon_button.dart';

class AboutDialogButton extends StatelessWidget {
  const AboutDialogButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleIconButton(
      iconColor: AppColors.mainLight,
      icon: Icons.info_outline_rounded,
      onPressed: (context) {
        showAboutDialog(
          context: context,
          applicationIcon: const AppIcon(side: 48),
          children: <Widget>[
            const Text(Manifest.description),
            const SizedBox(height: 10),
            const Text('Version: ${Manifest.version}'),
            const Text('Build date: ${Manifest.buildDate}'),
            const SizedBox(height: 10),
            const Text('License:'),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.mainDark,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Text(Manifest.license),
            ),
          ],
        );
      },
    );
  }
}
