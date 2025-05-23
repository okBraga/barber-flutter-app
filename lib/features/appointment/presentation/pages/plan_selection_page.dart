import 'package:barber_app/core/components/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:flutter/material.dart';

class PlanSelectionPage extends StatefulWidget {
  const PlanSelectionPage({super.key});

  @override
  State<PlanSelectionPage> createState() => _PlanSelectionPageState();
}

class _PlanSelectionPageState extends State<PlanSelectionPage> {
  String? _selectedPlan;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomButtonBar(
          buttonText: 'Selecionar plano',
          onPressed: () {},
        ),
        appBar: AppBar(
          title: const Text(
            'Assinaturas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Escolha seu plano',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Cancele quando quiser',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),
              PlanCard(
                title: 'Corte Masculino Ilimitado',
                price: 'R\$ 69,60/mês',
                description: 'Corte o cabelo quantas vezes quiser no mês',
                isSelected: _selectedPlan == 'Corte Masculino Ilimitado',
                onTap: () => setState(() {
                  _selectedPlan = 'Corte Masculino Ilimitado';
                }),
              ),
              const SizedBox(height: 16),
              PlanCard(
                title: 'Corte + Barba Ilimitado',
                price: 'R\$ 99,90/mês',
                description: 'Corte de cabelo e barba ilimitados no mês',
                isSelected: _selectedPlan == 'Corte + Barba Ilimitado',
                isPopular: true,
                onTap: () => setState(() {
                  _selectedPlan = 'Corte + Barba Ilimitado';
                }),
              ),
              const SizedBox(height: 16),
              PlanCard(
                title: 'Combo Ilimitado',
                price: 'R\$ 119,90/mês',
                description: 'Cabelo, barba e sobrancelha ilimitados no mês',
                isSelected: _selectedPlan == 'Combo Ilimitado',
                onTap: () => setState(() {
                  _selectedPlan = 'Combo Ilimitado';
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO refatorar tela e componente

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final bool isSelected;
  final bool isPopular;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    this.isSelected = false,
    this.isPopular = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.black : (isPopular ? Colors.black : Colors.grey[300]!),
            width: isSelected ? 2 : (isPopular ? 1.5 : 1),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPopular)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'MAIS POPULAR',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
