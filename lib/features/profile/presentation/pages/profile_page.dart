import 'package:barber_app/core/components/bottom_navigation_bar/custom_navigation_bar.dart';
import 'package:barber_app/core/navigation/app_routes.dart';
import 'package:barber_app/features/auth/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:barber_app/core/components/buttons/primary_button.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final int _selectedIndex = 2;

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
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationTapped: _onItemTapped,
      ),
      appBar: AppBar(
        title: const Text(
          'Meu Perfil',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ListView(
          children: [
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'João Silva',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'joao@exemplo.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '(11) 98765-4321',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('Preferências'),
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              child: Column(
                children: [
                  _buildPreferenceItem(
                    icon: Icons.person,
                    title: 'Barbeiro Preferido',
                    value: 'Fred',
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 16),
                  _buildPreferenceItem(
                    icon: Icons.cut,
                    title: 'Serviço Favorito',
                    value: 'Corte + Barba',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('Configurações'),
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              child: Column(
                children: [
                  _buildSettingItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notificações',
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 16),
                  _buildSettingItem(
                    icon: Icons.credit_card,
                    title: 'Formas de Pagamento',
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 16),
                  _buildSettingItem(
                    icon: Icons.security,
                    title: 'Privacidade',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              onPressed: () async {
                await AuthService().signOut();
                GoRouter.of(context).go(AppRoutes.serviceType);
              },
              isPrimary: true,
              child: const Text(
                'Sair da Conta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildPreferenceItem({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title),
      subtitle: Text(
        value,
        style: TextStyle(color: Colors.grey[600]),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
