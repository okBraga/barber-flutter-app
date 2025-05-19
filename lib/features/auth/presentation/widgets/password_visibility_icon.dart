import 'package:flutter/material.dart';

class PasswordVisibilityIcon extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onPressed;

  const PasswordVisibilityIcon({
    super.key,
    required this.isVisible,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isVisible
          ? Icon(Icons.visibility_outlined, color: Colors.grey[500])
          : Icon(
              Icons.visibility_off_outlined,
              color: Colors.grey[400],
            ),
      onPressed: onPressed,
    );
  }
}
