import 'package:barber_app/core/components/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class BottomButtonBar extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const BottomButtonBar({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: PrimaryButton(
          onPressed: onPressed,
          isPrimary: true,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
