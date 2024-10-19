import 'dart:io';

import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class UpgradeWrapper extends StatelessWidget {
  const UpgradeWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      upgrader: Upgrader(),
      child: child,
    );
  }
}
