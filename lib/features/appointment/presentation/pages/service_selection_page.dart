import 'package:barber_app/core/components/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:barber_app/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:barber_app/features/appointment/presentation/widgets/service_card.dart';
import 'package:go_router/go_router.dart';

class ServiceSelectionPage extends StatelessWidget {
  final List<Map<String, String>> services = [
    {'service': 'Corte Tesoura', 'price': '35', 'duration': '45 min'},
    {'service': 'Corte Máquina', 'price': '25', 'duration': '30 min'},
    {'service': 'Corte Máquina e Tesoura', 'price': '30', 'duration': '60 min'},
    {'service': 'Barba', 'price': '20', 'duration': '30 min'},
    {'service': 'Sobrancelha', 'price': '10', 'duration': '15 min'},
    {'service': 'Alisamento Americano', 'price': '50', 'duration': '90 min'},
    {'service': 'Colorimetria Masculina', 'price': '60', 'duration': '120 min'},
  ];

  ServiceSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Selecione os serviços',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: services.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final service = services[index];
          return ServiceCard(
            title: service['service']!,
            price: service['price']!,
            duration: service['duration']!,
          );
        },
      ),
      bottomNavigationBar: BottomButtonBar(
        buttonText: 'Continuar',
        onPressed: () => GoRouter.of(context).push(AppRoutes.booking),
      ),
    );
  }
}
