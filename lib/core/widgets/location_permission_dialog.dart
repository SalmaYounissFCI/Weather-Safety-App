import 'package:flutter/material.dart';

class LocationPermissionDialog extends StatelessWidget {
  final VoidCallback onAllowPressed;

  const LocationPermissionDialog({super.key, required this.onAllowPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Row(
        children: [
          Icon(Icons.location_on_outlined, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          const Text('Location Permission'),
        ],
      ),
      content: const Text(
        'To provide you with accurate weather information for your area, please allow this app to access your device\'s location.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Deny'),
        ),
        FilledButton(onPressed: onAllowPressed, child: const Text('Allow')),
      ],
    );
  }
}
