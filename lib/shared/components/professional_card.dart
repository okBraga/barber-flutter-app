import 'package:flutter/material.dart';

class ProfessionalCard extends StatelessWidget {
  final bool isAnyProfessional;
  final VoidCallback onTap;
  final Widget professionalImage;
  final String professionalName;
  final String availability;
  final bool isSelected;

  const ProfessionalCard({
    super.key,
    required this.isAnyProfessional,
    required this.onTap,
    required this.professionalImage,
    required this.professionalName,
    required this.availability,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isAnyProfessional
                ? Icon(
                    Icons.shuffle,
                    size: 40,
                    color: isSelected ? Colors.white : Colors.black,
                  )
                : Icon(
                    Icons.person,
                    size: 40,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
            const SizedBox(height: 16),
            Expanded(
              child: Text(
                professionalName,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white : Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              availability,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white.withValues(alpha: 0.8) : Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (!isAnyProfessional) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Spacer(),
                  Flexible(
                    flex: 1,
                    child: Divider(
                      color: Colors.grey.shade300,
                      thickness: 2,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: isSelected ? Colors.white : Colors.blue.shade600,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Sobre $professionalName',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
