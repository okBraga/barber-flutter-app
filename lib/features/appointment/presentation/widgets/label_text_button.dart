import 'package:flutter/material.dart';

class LabelTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const LabelTextButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'Editar',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
