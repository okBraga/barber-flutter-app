import 'package:barber_app/core/components/bottom_navigation_bar/custom_navigation_bar.dart';
import 'package:barber_app/core/components/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:barber_app/core/navigation/app_routes.dart';

class ServiceType extends StatefulWidget {
  const ServiceType({super.key});

  @override
  State<ServiceType> createState() => _ServiceTypeState();
}

class _ServiceTypeState extends State<ServiceType> {
  final int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        GoRouter.of(context).go(AppRoutes.serviceType);
        break;
      case 1:
        GoRouter.of(context).push(AppRoutes.appointments);
        break;
      case 2:
        GoRouter.of(context).push(AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Barbearia',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              onPressed: () => GoRouter.of(context).push(AppRoutes.serviceSelection),
              isPrimary: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cut,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Agendar corte',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.planSelection);
              },
              isPrimary: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assignment,
                    color: Colors.black,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Assinar Plano',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationTapped: _onItemTapped,
      ),
    );
  }
}
