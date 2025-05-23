import 'package:barber_app/core/components/bottom_navigation_bar/custom_navigation_bar.dart';
import 'package:barber_app/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:barber_app/core/components/buttons/primary_button.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final int _selectedIndex = 1;

  final List<Map<String, dynamic>> _appointments = [
    {
      'date': DateTime.now().add(const Duration(days: 2)),
      'time': '14:30',
      'services': ['Corte Máquina', 'Barba Completa'],
      'professional': 'Fred',
      'expanded': false
    },
    {
      'date': DateTime.now().add(const Duration(days: 5)),
      'time': '10:00',
      'services': ['Corte Tesoura', 'Sobrancelha'],
      'professional': 'Carlos',
      'expanded': false
    },
  ];

  void _toggleExpand(int index) {
    setState(() {
      _appointments[index]['expanded'] = !_appointments[index]['expanded'];
    });
  }

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
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationTapped: _onItemTapped,
      ),
      appBar: AppBar(
        title: const Text(
          'Meus Agendamentos',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ListView.separated(
          itemCount: _appointments.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final appointment = _appointments[index];
            final dateFormat = DateFormat('EEEE, dd MMMM', 'pt_BR');
            final formattedDate = dateFormat.format(appointment['date']);

            return Card(
              elevation: 0,
              color: Colors.white,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => _toggleExpand(index),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formattedDate,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Horário: ${appointment['time']}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            appointment['expanded'] ? Icons.expand_less : Icons.expand_more,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      if (appointment['expanded']) ...[
                        const Divider(height: 24, thickness: 1),
                        Text(
                          'Profissional: ${appointment['professional']}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Serviços:',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ...appointment['services'].map<Widget>((service) => Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    service,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                  side: BorderSide(color: Colors.grey[300]!),
                                ),
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: PrimaryButton(
                                onPressed: () {},
                                isPrimary: true,
                                child: const Text(
                                  'Reagendar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
