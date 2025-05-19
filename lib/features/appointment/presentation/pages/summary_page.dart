import 'package:barber_app/core/components/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:barber_app/core/components/buttons/primary_button.dart';
import 'package:barber_app/core/navigation/app_routes.dart';
import 'package:barber_app/features/appointment/presentation/widgets/info_card.dart';
import 'package:barber_app/features/appointment/presentation/widgets/label_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SummaryPage extends StatelessWidget {
  final List<Map<String, dynamic>> selectedServices = [
    {"name": "Corte de Cabelo", "price": 50.0},
    {"name": "Barba", "price": 30.0},
    {"name": "Tratamento Capilar", "price": 70.0},
  ];

  final String selectedProfessional = "Fred";
  final DateTime selectedDate = DateTime.now().add(const Duration(days: 3));
  final String selectedTime = "14:00";

  SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice = selectedServices.fold(0.0, (sum, service) => sum + service["price"]);

    final dateFormat = DateFormat('EEEE, dd MMMM y', 'pt_BR');
    final formattedDate = dateFormat.format(selectedDate);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Resumo do Agendamento",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            LabelTextButton(
              title: 'Profissional',
              onTap: () => _showProfessionalOptions(context),
            ),
            InfoCard(
              title: selectedProfessional,
              subtitle: 'Especialista em cortes masculinos',
              child: Icon(
                Icons.person,
                size: 24,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            LabelTextButton(
              title: 'Data e Horário',
              //TODO implementar edição de data e horário
              onTap: () {},
            ),
            InfoCard(
              title: formattedDate,
              subtitle: 'Horário: $selectedTime',
              child: Icon(
                Icons.calendar_today,
                size: 24,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            LabelTextButton(
              title: 'Serviços Selecionados',
              //TODO implementar edição de serviços
              onTap: () {},
            ),
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    ...selectedServices.map((service) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: _buildServiceItem(
                            name: service['name'],
                            price: service['price'],
                          ),
                        )),
                    const Divider(height: 24, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'R\$ ${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtonBar(
        buttonText: 'Confirmar Agendamento',
        onPressed: () => _confirmAppointment(context),
      ),
    );
  }

  void _confirmAppointment(BuildContext context) {
    const isLoggedIn = false;

    if (!isLoggedIn) {
      _showAuthRequiredDialog(context);
      return;
    }

    _showConfirmationDialog(context);
  }

  void _showAuthRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Cadastre-se para confirmar',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        content: const Text(
          'Você precisa de uma conta para agendar seu horário.',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                    GoRouter.of(context).push(AppRoutes.login);
                  },
                  isPrimary: false,
                  child: const Text(
                    'Já tenho conta',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                    GoRouter.of(context).go(AppRoutes.signUp);
                  },
                  isPrimary: true,
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Confirmar Agendamento',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 48),
            SizedBox(height: 16),
            Text('Deseja confirmar este agendamento?'),
          ],
        ),
        actions: [
          PrimaryButton(
            onPressed: () => GoRouter.of(context).pop(),
            isPrimary: false,
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.black),
            ),
          ),
          PrimaryButton(
            onPressed: () {
              GoRouter.of(context).go(AppRoutes.serviceType);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Agendamento confirmado com sucesso!'),
                  backgroundColor: Colors.black,
                ),
              );
            },
            isPrimary: true,
            child: const Text(
              'Confirmar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem({required String name, required double price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'R\$ ${price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _showProfessionalOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Escolha seu profissional',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                _buildProfessionalOption('Fred', true),
                _buildProfessionalOption('Carlos', false),
                const SizedBox(height: 24),
                PrimaryButton(
                  onPressed: () => Navigator.pop(context),
                  isPrimary: true,
                  child: const Text('Confirmar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfessionalOption(String name, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey[300]!,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            if (isSelected) const Icon(Icons.check, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
