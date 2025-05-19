import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final String title;
  final String price;
  final String duration;

  const ServiceCard({
    super.key,
    required this.title,
    required this.price,
    required this.duration,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? Colors.black : Colors.grey[300]!,
          width: 1,
        ),
      ),
      color: isSelected ? Colors.black.withValues(alpha: 0.03) : Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => setState(() => isSelected = !isSelected),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getServiceIcon(),
                  color: isSelected ? Colors.white : Colors.black87,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.black : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.duration,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'R\$ ${widget.price}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.black : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getServiceIcon() {
    if (widget.title.contains('Tesoura')) return Icons.content_cut;
    if (widget.title.contains('Máquina')) return Icons.cut;
    if (widget.title.contains('Barba')) return Icons.face;
    if (widget.title.contains('Sobrancelha')) return Icons.visibility;
    if (widget.title.contains('Alisamento')) return Icons.gesture_sharp;
    if (widget.title.contains('Colorimetria')) return Icons.palette;
    return Icons.clean_hands;
  }
}
