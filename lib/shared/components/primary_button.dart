import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double? elevation;
  final Widget child;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.child,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: elevation,
      ),
      child: child,
    );
  }
}
