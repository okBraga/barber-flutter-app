import 'package:barber_app/shared/components/service_card.dart';
import 'package:barber_app/shared/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceSelectionPage extends StatelessWidget {
  const ServiceSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: const Text(
          "Selecione os Serviços",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "Cortes",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            ServiceCard(title: "Corte Tesoura", price: "R\$ 30,00"),
            ServiceCard(title: "Corte Máquina e Tesoura", price: "R\$ 45,00"),
            ServiceCard(title: "Corte Máquina", price: "R\$ 60,00"),
            SizedBox(height: 20),
            Text(
              "Barba",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            ServiceCard(title: "Barba Simples", price: "R\$ 15,00"),
            ServiceCard(title: "Barba Completa", price: "R\$ 30,00"),
            SizedBox(height: 20),
            Text(
              "Tratamentos",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ServiceCard(title: "Alisamento Americano", price: "R\$ 30,00"),
            ServiceCard(title: "Colorimetria Masculina", price: "R\$ 30,00"),
            SizedBox(height: 20),
            Text(
              "Sobrancelha",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ServiceCard(title: "Sobrancelha", price: "R\$ 10,00"),
            ServiceCard(title: "Apenas risquinho", price: "R\$ 5,00"),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.professionalSelection);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Confirmar Serviços",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
