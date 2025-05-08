import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final String title;
  final String price;

  const ServiceCard({super.key, required this.title, required this.price});

  @override
  ServiceCardState createState() => ServiceCardState();
}

class ServiceCardState extends State<ServiceCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(widget.title),
        subtitle: Text(widget.price),
        trailing: Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.black,
          value: isSelected,
          onChanged: (bool? value) {
            setState(() {
              isSelected = value ?? false;
            });
          },
        ),
      ),
    );
  }
}
