import 'package:barber_app/shared/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final String category;

  const HomePage(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category - Escolha uma opção'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOption(
              context,
              title: 'Agendar um horário',
              icon: Icons.calendar_today,
              color: Colors.green,
              onTap: () {
                GoRouter.of(context).push(AppRoutes.dateSelection);
              },
            ),
            SizedBox(height: 20),
            _buildOption(
              context,
              title: 'Assinar um plano',
              icon: Icons.card_membership,
              color: Colors.orange,
              onTap: () {
                GoRouter.of(context).push(AppRoutes.plan);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, {required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 40, color: color),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_forward_ios, color: color),
          ],
        ),
      ),
    );
  }
}
