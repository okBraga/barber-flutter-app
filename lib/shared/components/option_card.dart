import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  final VoidCallback onTap;

  final TextStyle? textStyle;

  const OptionCard({
    super.key,
    required this.onTap,
    this.padding,
    required this.backgroundColor,
    this.textStyle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: padding ?? EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          spacing: 4.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle.merge(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                child: child),
          ],
        ),
      ),
    );
  }
}
