import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationTapped;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationTapped,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationTapped,
      indicatorColor: Colors.black,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined, color: Colors.black),
          selectedIcon: Icon(Icons.home, color: Colors.white),
          label: 'Início',
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_today_outlined, color: Colors.black),
          selectedIcon: Icon(Icons.calendar_today, color: Colors.white),
          label: 'Agendamentos',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outlined, color: Colors.black),
          selectedIcon: Icon(Icons.person, color: Colors.white),
          label: 'Perfil',
        ),
      ],
    );
  }
}
