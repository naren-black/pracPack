import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformAlert {
  final String title, message;
  PlatformAlert({required this.title, required this.message})
      : assert(title != null),
        assert(message != null);

  void show(BuildContext context) {
    final ptfm = Theme.of(context).platform;

    if (ptfm == TargetPlatform.iOS) {
      _buildCupertinoAlert(context);
    } else {
      _buildMaterialAlert(context);
    }
  }

  void _buildMaterialAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close madi'),
            ),
          ],
        );
      },
    );
  }

  void _buildCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close maadi again'),
            ),
          ],
        );
      },
    );
  }
}
